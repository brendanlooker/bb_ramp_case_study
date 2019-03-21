view: order_items_fact {
    derived_table: {
      sql: select order_items.id,
              case when ((order_items.returned_at  IS NULL) AND (order_items.status <> 'Cancelled' OR order_items.status IS NULL) then order_items.sale_price else 0 End - inventory_items.cost as gross_margin,
              dense_rank() over (partition by user_id order by created_at asc) as order_sequence,
              nvl(datediff(day,lag(created_at,1) over (partition by user_id order by created_at asc),created_at),0) as days_to_previous_order
              from order_items join inventory_items on order_items.inventory_item_id = inventory_items.id
               ;;
    }
    view_label: "Orders"


    dimension: id {
      primary_key:yes
      hidden: yes
      type: number
      sql: ${TABLE}.id ;;
    }

    dimension: order_sequence {
      type: number
      sql: ${TABLE}.order_sequence ;;
    }

  dimension: is_first_purchase {
    type: yesno
    sql: ${TABLE}.order_sequence = 0;;
  }

  dimension: has_subsequent_order {
    type: yesno
    sql: ${TABLE}.order_sequence > 0;;
  }

#   dimension: is_60_day_repeat_customer {
#     type: yesno
#     sql: ${TABLE}.order_sequence > 0 and ;;
#   }

    dimension: days_to_previous_order {
      type: number
      sql:${TABLE}.days_to_previous_order ;;
    }

    measure: average_number_of_days_between_orders {
      type: average
      sql: ${TABLE}.days_to_previous_order ;;
    }

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
