view: order_product {
  derived_table: {
    persist_for: "24 hours"
    distribution_style: all

    sortkeys: ["order_id"]


    sql: SELECT oi.order_id as order_id
      , oi.id as order_item_id
      , oi.created_at
      , oi.inventory_item_id as inventory_item_id
      , p.name as product
      FROM order_items oi
      JOIN inventory_items ii ON oi.inventory_item_id = ii.id
      JOIN products p ON ii.product_id = p.id
      GROUP BY 1,2,3,4,5;;
  }
}
