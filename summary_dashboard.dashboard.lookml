- dashboard: summary_dashboard
  title: Summary Dashboard
  layout: newspaper
  elements:
  - title: Total Revenue Yesterday
    name: Total Revenue Yesterday
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
    row: 0
    col: 3
    width: 5
    height: 2
  - title: Yesterday's New Users
    name: Yesterday's New Users
    model: bb_ramp_case_study
    explore: order_items
    type: single_value
    fields: [users.user_count]
    filters:
      users.created_date: yesterday
    limit: 500
    column_limit: 50
    query_timezone: UTC
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Yesterday's New Users
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    row: 0
    col: 8
    width: 5
    height: 2
  - title: Gross Margin Last 30 Days
    name: Gross Margin Last 30 Days
    model: bb_ramp_case_study
    explore: order_items
    type: single_value
    fields: [order_items.gross_margin_pct]
    filters:
      order_items.created_date: 30 days
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Gross Margin Past 30 Days
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields: []
    y_axes: []
    row: 0
    col: 18
    width: 5
    height: 2
  - title: Average Spend Past 30 Days
    name: Average Spend Past 30 Days
    model: bb_ramp_case_study
    explore: order_items
    type: single_value
    fields: [users.average_spend_per_user]
    filters:
      order_items.created_date: 30 days
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Average Spend Past 30 Days
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    row: 0
    col: 13
    width: 5
    height: 2
  - title: Revenue by Year
    name: Revenue by Year
    model: bb_ramp_case_study
    explore: order_items
    type: looker_column
    fields: [order_items.total_gross_revenue, order_items.created_year]
    fill_fields: [order_items.created_year]
    filters:
      order_items.created_year: 5 years
    sorts: [order_items.created_year desc]
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: left, series: [{id: order_items.total_gross_revenue,
            name: Orders Total Gross Revenue, axisId: order_items.total_gross_revenue}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    x_axis_label: ''
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#000000"}]
    trend_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    row: 2
    col: 19
    width: 5
    height: 15
  - title: Revenue and Profit last 12 Months
    name: Revenue and Profit last 12 Months
    model: bb_ramp_case_study
    explore: order_items
    type: looker_line
    fields: [order_items.total_gross_revenue, order_items.total_gross_margin, order_items.created_month]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_date: 13 months
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    y_axes: []
    row: 9
    col: 0
    width: 19
    height: 8
  - title: New Users MTD
    name: New Users MTD
    model: bb_ramp_case_study
    explore: users
    type: looker_column
    fields: [users.user_count, events.created_month]
    fill_fields: [events.created_month]
    filters:
      events.created_date: after 12 months ago
    sorts: [events.created_month desc]
    limit: 500
    filter_expression: "${events.created_day_of_month} <= ${events.current_day_of_month}"
    query_timezone: UTC
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: Event Count, orientation: left, series: [{id: users.user_count,
            name: Users User Count, axisId: users.user_count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 94,
        type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Event Month
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    row: 2
    col: 0
    width: 7
    height: 7
  - title: Revenue by Demographic and Gender
    name: Revenue by Demographic and Gender
    model: bb_ramp_case_study
    explore: users
    type: looker_column
    fields: [order_items.total_gross_revenue, users.age_tier, users.gender]
    pivots: [users.gender]
    fill_fields: [users.age_tier]
    sorts: [users.age_tier, users.gender]
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: Revenue, orientation: left, series: [{id: Female - order_items.total_gross_revenue,
            name: Female, axisId: order_items.total_gross_revenue}, {id: Male - order_items.total_gross_revenue,
            name: Male, axisId: order_items.total_gross_revenue}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Age Bucket
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    row: 2
    col: 7
    width: 12
    height: 7
  - title: Revenue by State
    name: Revenue by State
    model: bb_ramp_case_study
    explore: order_items
    type: looker_map
    fields: [order_items.total_gross_margin, users.state_map]
    filters:
      order_items.created_year: 1 years
      users.state: ''
    sorts: [order_items.total_gross_margin desc]
    limit: 500
    query_timezone: GMT
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: false
    map_tile_provider: light
    map_position: custom
    map_latitude: 41.95949009892467
    map_longitude: -114.72747802734376
    map_zoom: 3
    map_scale_indicator: metric
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 17
    col: 0
    width: 16
    height: 11
  - title: Top 10 Products by Revenue and Margin
    name: Top 10 Products by Revenue and Margin
    model: bb_ramp_case_study
    explore: order_items
    type: table
    fields: [products.brand, order_items.gross_margin_pct, order_items.total_gross_revenue]
    filters:
      order_items.created_month: 3 months
    sorts: [order_items.total_gross_revenue desc]
    limit: 10
    column_limit: 50
    total: true
    row_total: right
    dynamic_fields: [{table_calculation: percentage_of_total_gross_revenue, label: Percentage
          of Total Gross Revenue, expression: "${order_items.total_gross_revenue}/${order_items.total_gross_revenue:total}",
        value_format: !!null '', value_format_name: percent_4, _kind_hint: measure,
        _type_hint: number}]
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    enable_conditional_formatting: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688, options: {steps: 5, stepped: true,
            mirror: true, constraints: {mid: {type: median}}, reverse: false}}, bold: false,
        italic: false, strikethrough: false, fields: [order_items.gross_margin_pct,
          order_items.total_gross_revenue, percentage_of_total_gross_revenue]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: []
    y_axes: []
    row: 17
    col: 16
    width: 8
    height: 8
