- dashboard: summary_dashboard_extended
  title: Summary Dashboard Extended
  layout: newspaper
  tile_size: 100
  extends: summary_dashboard
  elements:
  - title: Total Revenue Tomorrow
    name: Total Revenue Tomorrow
    model: bb_ramp_case_study
    explore: order_items
    type: single_value
    fields: [order_items.total_gross_revenue]
    filters:
      order_items.created_date: yesterday
    limit: 10
    query_timezone: UTC
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
    custom_color_enabled: true
    custom_color: "#ca89ff"
    show_single_value_title: true
    single_value_title: Total Revenue Yesterday
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields: []
    y_axes: []
    row: 30
    col: 3
    width: 5
    height: 2
