connection: "thelook_events_redshift"

include: "order_product.view.lkml"
include: "total_order_product.view.lkml"
include: "total_orders.view.lkml"
include: "order_purchase_affinity.view.lkml"


explore: order_purchase_affinity {
  label: "Affinity"
  view_label: "Affinity"

  always_filter: {
    filters: {
      field: affinity_timeframe
      value: "last 90 days"
    }
  }

  join: total_orders {
    type: cross
    relationship: many_to_one
  }
}
