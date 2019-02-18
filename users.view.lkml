view: users {
  sql_table_name: public.users ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: age_tier {
    type: tier
    tiers: [15,26,36,51,66]
    style: integer
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    drill_fields: [longitude,latitude]
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
    drill_fields: [state]
  }

  dimension: country_map {
    map_layer_name: countries
    sql: ${country} ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: days_since_signup {
    type: number
    sql: datediff(day,${created_date}, now()) ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    drill_fields: [city]
  }

  dimension: state_map {
    map_layer_name: us_states
    sql: ${TABLE}.state ;;
  }

  dimension: user_location {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
    drill_fields: [age_tier, gender]
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  dimension: is_new_user {
    type: yesno
    sql: ${current_date}-${created_date} < 90;;
  }

  dimension_group: current {
    type: time
    sql: GETDATE() ;;
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
    sql: 1.0*${order_items.total_sales}/${user_count} ;;
    value_format_name: usd_0
    description: "Average spend per User (all Users)"
  }

  measure: user_count {
    type: count
    drill_fields: [id, first_name, last_name, events.count, order_items.count]
  }
}
