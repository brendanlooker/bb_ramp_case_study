view: period_over_period {

  dimension: dummy_dim {
    primary_key: yes
    hidden: yes
    type: number
    sql: 1 ;;
  }

  parameter: period_over_period {
    type: string
    label: "Period-over-Period"
    allowed_value: {
      label: "Year-over-Year"
      value: "YoY"
    }
    allowed_value: {
      label: "Month-over-Month (v Previous Year)"
      value: "MoM-Y"
    }
    allowed_value: {
      label: "Month-over-Month (v Previous Month)"
      value: "MoM-M"
    }
    allowed_value: {
      label: "Quarter-over-Quarter (v Previous Quarter)"
      value: "QoQ-Q"
    }
    allowed_value: {
      label: "Quarter-over-Quarter (v Previous Year)"
      value: "QoQ-Y"
    }
  }

  parameter: date_field {
    type: unquoted
    allowed_value: {
      label: "User Created Date"
      value: "users.created_at"
    }
    allowed_value: {
      label: "Order Items Created Date"
      value: "order_items.created_at"
    }
  }

  parameter: pop_offset {
    type: number
    default_value: "0"
    description: "Used to offset the Month and Quarter PoP Analysis"
  }

  filter: pop_filter {
    description: "Required in order to dynamically inject SQL into the where clause based on the period-over-period analysis required"
    hidden: no
    default_value: "is not null"
    type: string
    sql: {% if period_over_period._parameter_value == "'YoY'" %}

            extract(month from {% parameter date_field %}) < extract(month from getdate())
            or (extract(month from {% parameter date_field %}) = extract(month from getdate()) and extract(day from {% parameter date_field %}) <= extract(day from getdate()))


          {% else %}

            NULL
          {% endif %} ;;
  }


}
