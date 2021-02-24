view: products {
  sql_table_name: public.products ;;
  # sql_table_name:  {% date_start date_filter %}.products;;


  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: bb_email {
    type: string
    sql: 'brendan.buckley@looker.com' ;;
  }

  dimension: brand_v2 {
    sql: case when ${brand} = 'Dockers' and ${category} in ('Accessories','Blazers & Jackets') then 'Doc' else ${brand} end ;;
  }

  dimension: brand {
    drill_fields: [department]
    type: string
    sql: ${TABLE}.brand ;;
    link: {
      label: "Google {{ value }}"
      url: "http://www.google.com/search?q={{ value }}"
      icon_url: "https://google.com/favicon.ico"
    }

    link: {
      label: "Brand Dash  {{ value }}"
      url: "/dashboards/136?Brand={{ value }}"
      icon_url: "https://looker.com/favicon.ico"
    }

#     action: {
#       label: "Email {{ products.bb_email._value }} re status of {{ value }}"
#       url: "https://hooks.zapier.com/hooks/catch/5803443/o2khmds/"
# #         url: "https://brendanlooker.free.beeceptor.com"
#
#       param: {
#         name: "email"
#         value: "{{ products.bb_email._value }}"
#       }
#
#       param: {
#         name: "subject"
#         value: "Subject Line for {{ value }}"
#       }
#       form_param: {
#         name: "Subject form"
#         type: string
#         label: "Form Details - Email Subject Line"
#         default: "Brand  {{ value }}"
#       }
#       form_param: {
#         name: "Email Body"
#         type: textarea
#         label: "Email Body"
#         default: "This is an email body relating to the brand {{ value }} for {{ products.bb_email._value }}"
#       }
#       form_param: {
#         name: "Audience"
#         type: select
#         option: {
#           name: "Internal"
#           label: "Internal"
#         }
#         option: {
#           name: "External"
#           label: "External"
#         }
#       }
#       }
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: distribution_center_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.distribution_center_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: product_count {
    type: count
    drill_fields: [id, name, distribution_centers.id, distribution_centers.name, inventory_items.count]
  }
}
