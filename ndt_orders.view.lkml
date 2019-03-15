view: ndt_orders {
    derived_table: {
      explore_source: order_items {
        column: order_id {field:order_items.order_id}
        column: order_item_count {}
        column: total_gross_revenue {}
        derived_column: average_revenue_per_item {sql: total_gross_revenue/order_item_count;;}
        derived_column: revenue_rank {sql: rank () over (average_revenue_per_item order by average_revenue_per_item desc) ;; }
      }}

    dimension: order_id {
      label: "Orders Order ID"
      type: number
    }
    dimension: order_item_count {
      label: "Orders Order Item Count"
      type: number
    }
    dimension: total_gross_revenue {
      label: "Orders Total Gross Revenue"
      description: "Total Gross Revenue - Total revenue from completed sales (cancelled and returned orders excluded)"
      value_format: "$#,##0"
      type: number
    }
    measure: average_revenue_per_item {type:number}
    dimension: revenue_rank {type:number}
  }
