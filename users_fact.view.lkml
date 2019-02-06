include: "users.view.lkml"
view: users_fact {
  extends: [users]

dimension: id {
  primary_key: yes
  type: number
  sql: ${TABLE}.id ;;
  }

  measure: users_who_have_returned_items {
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: order_items.returned_date
      value: "-NULL"

    }
    description: "Count of distinct users who have returned an item"
  }

  measure: users_with_returns_pct {
    type: number
    sql: 1.0*${users_who_have_returned_items}/${user_count};;
    value_format_name: percent_2
    description: "Percentage of Users who have returned an item"
  }

  measure: average_spend_per_user {
    type: number
    sql: 1.0*${order_items_fact.total_sales}/${user_count} ;;
    value_format_name: usd_0
    description: "Average spend per User (all Users)"
  }

}
