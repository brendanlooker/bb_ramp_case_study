
view: order_items {
  sql_table_name: public.order_items ;;


  view_label: "Orders"

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      day_of_month,
      month_name,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: delivered {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.delivered_at ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
    value_format_name: usd
  }

  dimension_group: shipped {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.shipped_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
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



  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [id]
  }
}
