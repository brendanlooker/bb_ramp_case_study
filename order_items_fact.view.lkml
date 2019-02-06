  include: "order_items.view.lkml"
  view: order_items_fact {
    extends: [order_items]
    derived_table: {
      sql: select order_items.id,
              sum(case when ((order_items.returned_at  IS NULL) AND (order_items.status <> 'Cancelled' OR order_items.status IS NULL)) then order_items.sale_price else 0 End) - sum(inventory_items.cost) as gross_margin
              from order_items join inventory_items on order_items.inventory_item_id = inventory_items.id
              group by 1
               ;;
    }

    view_label: "Orders"

    dimension: id {
      primary_key: no
      hidden: yes
      type: number
      sql: ${TABLE}.id ;;
    }

    dimension: gross_margin {
      type: number
      sql: ${TABLE}.gross_margin ;;
    }

    measure: total_sales {
      type: sum
      sql: ${sale_price};;
      value_format_name: usd_0
      description: "Total Sale Price"
    }

    measure: average_sale_price {
      type: average
      sql: ${sale_price};;
      description: "Average Sale Price"
      value_format_name: usd_0
    }

    measure: cumulative_total_sales {
      type: running_total
      sql: ${total_sales} ;;
      value_format_name: usd_0
      description: "Cumulative Total Sales"
    }

    measure: total_gross_revenue {
      type: sum
      sql: ${sale_price} ;;
      filters: {
        field: returned_date
        value: "NULL"
      }
      filters: {
        field: status
        value: "-Cancelled"
      }
      value_format_name: usd_0
      description: "Total Gross Revenue - Total revenue from completed sales (cancelled and returned orders excluded)"
      drill_fields: [order_id,created_date,user_id,products.name,sale_price]
    }

    measure: total_gross_margin {
      type: number
      sql: ${total_gross_revenue}-${inventory_items.total_cost} ;;
      value_format_name: usd_0
      description: "Total Gross Margin - Total Gross Revenue minus Total Cost"
      drill_fields: [products.brand, total_gross_margin]
    }

    measure: total_gross_revenue_all_orders {
      type: sum
      sql: ${sale_price} ;;
      value_format_name: usd_0
      description: "Total Gross Revenue All Orders - Total revenue from completed sales (cancelled and returned orders included)"
    }

    measure: gross_margin_pct {
      type: number
      sql: ${total_gross_margin}/${total_gross_revenue_all_orders} ;;
      value_format_name: percent_2
      description: "Gross Margin Percentage - Total Gross Margin devided by Total Revenue"
      drill_fields: [created_date, gross_margin_pct]
    }

    measure: average_gross_margin {
      type: average
      sql: ${order_items_fact.gross_margin} ;;
      value_format_name: usd_0
      description: "Average Gross Margin"
    }

    measure: number_of_items_returned {
      type: count_distinct
      sql: ${inventory_item_id} ;;
      filters: {
        field: returned_date
        value: "-NULL"
      }
      description: "Number of Items Returned"
    }

    measure: item_return_rate {
      type: number
      sql: (1.0*${number_of_items_returned}/${inventory_items.total_items_sold}) ;;
      description: "Items Returned Rate"
      value_format_name: percent_2
    }

    measure: order_item_count {
      type: count
      drill_fields: [detail*]
    }

    set: detail {
      fields: [id, gross_margin]
    }
  }
