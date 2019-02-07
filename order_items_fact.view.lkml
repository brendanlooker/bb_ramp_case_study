view: order_items_fact {
    derived_table: {
      sql: select order_items.id,
              sum(case when ((order_items.returned_at  IS NULL) AND (order_items.status <> 'Cancelled' OR order_items.status IS NULL)) then order_items.sale_price else 0 End) - sum(inventory_items.cost) as gross_margin
              from order_items join inventory_items on order_items.inventory_item_id = inventory_items.id
              group by 1
               ;;
    }
    view_label: "Orders"

    dimension: id {
      primary_key:yes
      hidden: yes
      type: number
      sql: ${TABLE}.id ;;
    }

#     dimension: gross_margin {
#       type: number
#       sql: ${TABLE}.gross_margin ;;
#     }

    measure: average_gross_margin {
      type: average
      sql: ${TABLE}.gross_margin ;;
      value_format_name: usd_0
      description: "Average Gross Margin"
    }

    measure: order_item_count {
      type: count
      drill_fields: [detail*]
    }

    set: detail {
      fields: [id, average_gross_margin]
    }
  }
