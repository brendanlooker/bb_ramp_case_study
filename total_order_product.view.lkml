view: total_order_product {
  derived_table: {
    sql: SELECT p.name as product
      , count(distinct oi.order_id) as product_order_count    -- count of orders with product, not total order items
      FROM order_items oi
      JOIN inventory_items ii ON oi.inventory_item_id = ii.id
      JOIN products p ON ii.product_id = p.id
      WHERE {% condition order_purchase_affinity.affinity_timeframe %} oi.created_at {% endcondition %}
      GROUP BY p.name
       ;;
  }
}
