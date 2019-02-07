connection: "thelook_events_redshift"

# include all the views
include: "*.view"

# datagroup: bb_ramp_case_study_default_datagroup {
#   # sql_trigger: SELECT MAX(id) FROM etl_log;;
#   max_cache_age: "1 hour"
# }

#persist_with: bb_ramp_case_study_default_datagroup

###################################################

explore: order_items {

  join: order_items_fact {
    type: inner
    sql_on: ${order_items.id}=${order_items_fact.id} ;;
    relationship: one_to_one
    view_label: "Orders"
  }
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
  label: "1) Order Items"
  group_label: "Ecommerce BB"
}


####################################

explore: users {
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
    type: left_outer
    sql_on: ${order_items.inventory_item_id}=${inventory_items.id} ;;
    relationship: one_to_one
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
