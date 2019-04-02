# connection: "thelook_events_redshift"

include: "*.view.lkml"                       # include all views in this project


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
