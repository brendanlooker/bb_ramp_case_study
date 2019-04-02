view: total_orders {
  derived_table: {
    sql: SELECT count(distinct order_id) as count
      FROM order_items
      WHERE {% condition order_purchase_affinity.affinity_timeframe %} created_at {% endcondition %}
       ;;
  }

  dimension: count {
    type: number
    sql: ${TABLE}.count ;;
    view_label: "Order Purchase Affinity"
    label: "Total Order Count"
  }
}
