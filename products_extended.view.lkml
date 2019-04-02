include: "products.view.lkml"
view: products_extended {
  extends: [products]

  dimension: new_brand_name {
    type: string
    sql: ${brand} || '-' || 'EXT' ;;
  }

#   dimension: id {
#     type: number
#     sql: ${TABLE}.id ;;
#     primary_key: yes
#   }
 }
