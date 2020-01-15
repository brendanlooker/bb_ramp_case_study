connection: "thelook_events_redshift"

# include all the views
include: "*.view"
include: "performance_dash.dashboard"

# datagroup: bb_ramp_case_study_default_datagroup {


explore: order_items {


  from: order_items_fact


  access_filter: {
    field: products.brand
    user_attribute: brand
    }
#   access_filter: {
#     field: users.state
#     user_attribute: brand
#   }

#   join: order_items_fact {
#     type: inner
#     sql_on: ${order_items.id}=${order_items_fact.id} ;;
#     relationship: one_to_one
#     view_label: "Order Items Fact"
#     fields: [detail*, -order_items_fact.id]
#   }
  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id};;
    relationship: one_to_one
  }
  join: products {
    type: left_outer
    sql_on: ${products.id}=${inventory_items.product_id} ;;
    relationship: many_to_one
  }
  join: distribution_centers {
    type: left_outer
    sql_on: ${distribution_centers.id} = ${products.distribution_center_id} ;;
    relationship: many_to_one
  }
  join: users {
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
  join: events {
    type: left_outer
    sql_on: ${events.user_id}=${users.id} ;;
    relationship: one_to_many
  }
  join: ndt_orders {
    type: left_outer
    relationship: many_to_one
    sql_on: ${ndt_orders.order_id} = ${order_items.order_id} ;;
  }
  label: "1) Order Items Test"
  group_label: "Ecommerce BB"
}

# explore: order_items {}
# explore: products_extended {}

####################################

explore: users {
  sql_preamble: select 1; ;;

  # join: period_over_period {
  #   type:cross
  #   # sql_on:${period_over_period.dummy_dim} = ${users.id};;
  #   relationship: many_to_one

  # }
  # always_join: [period_over_period]

  join: events {


    type: left_outer
    sql_on: ${users.id} = ${events.user_id} ;;
    relationship: one_to_many
  }
  join: order_items {
    type: left_outer
    sql_on: ${users.id}= ${order_items.user_id} ;;
    relationship: one_to_many
  }
  join: order_items_fact {
    type: inner
    sql_on: ${order_items.id}=${order_items_fact.id} ;;
    relationship: one_to_one
  }
  join: inventory_items {
#     view_label: "Users" -- Relable
    type: left_outer
    sql_on: ${order_items.inventory_item_id}=${inventory_items.id} ;;
    relationship: one_to_one
#     fields: [inventory_items.cost, inventory_items.average_cost] -- bring in fields needed
  }
  label: "2) Customers"
  group_label: "Ecommerce BB"
}


####################################


explore: customer_behaviour_fact {
    label: "3) Customer Behaviour"
    group_label: "Ecommerce BB"

    join: order_items {
      type: left_outer
      sql_on: ${customer_behaviour_fact.user_id}=${order_items.user_id} ;;
      relationship: one_to_many
    }
    join: inventory_items {
      type: inner
      sql_on: ${inventory_items.id}=${order_items.inventory_item_id};;
      relationship: one_to_one
    }
  join: products {
    type: left_outer
    sql_on: ${products.id}=${inventory_items.product_id} ;;
    relationship: many_to_one
    }
}

# explore: users_fact {
#   join: order_items {
#     type: left_outer
#     sql_on: ${users_fact.id}= ${order_items.user_id} ;;
#     relationship: one_to_many
#     fields: [users_fact.id]
#     }
#   join: inventory_items {
#     type: left_outer
#     sql_on: ${order_items.inventory_item_id} = ${inventory_items.id};;
#     relationship: one_to_one
#   }
# }

# explore: users_all {
#   from: users_fact
#   join: order_items {
#     relationship: one_to_many
#     sql_on: ${users_all.id}=${order_items.user_id} ;;
#   }
#   join: inventory_items {
#     sql_on: ${inventory_items.id}=${order_items.inventory_item_id} ;;
#     relationship: one_to_one
#   }
# }

# explore: order_items_extended { from:order_items    join: inventory_items {
#     type: inner
#     sql_on: ${inventory_items.id}=${order_items_extended.inventory_item_id};;
#     relationship: one_to_one
#   }}

#
explore: ndt_orders {
  label: "4) NDT Orders"
  group_label: "Ecommerce BB"
}
