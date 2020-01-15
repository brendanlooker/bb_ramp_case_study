- dashboard: performance_dashboard
  title: Performance Dashboard
  layout: newspaper
  elements:
  - title: Dashboards with Refresh Interval
    name: Dashboards with Refresh Interval
    model: system__activity
    explore: history
    type: table
    fields: [dashboard.title, history.real_dash_id, dashboard.refresh_interval]
    filters:
      dashboard.refresh_interval: "-NULL"
    sorts: [dashboard.refresh_interval desc]
    limit: 50
    query_timezone: UTC
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting: [{type: low to high, value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"], __FILE: SSO_demo/performance_dash.dashboard.lookml,
          __LINE_NUM: 150}, bold: false, italic: false, strikethrough: false, fields: !!null '',
        __FILE: SSO_demo/performance_dash.dashboard.lookml, __LINE_NUM: 149}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen: {}
    row: 45
    col: 13
    width: 11
    height: 9
  - title: Unlimited Downoads
    name: Unlimited Downoads
    model: system__activity
    explore: history
    type: table
    fields: [history.created_time, query.link, user.id, user.name, query.limit]
    filters:
      query.limit: "%-1%"
    sorts: [history.created_time desc]
    limit: 500
    column_limit: 50
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    listen: {}
    row: 37
    col: 13
    width: 11
    height: 8
  - title: Failed Schedules
    name: Failed Schedules
    model: system__activity
    explore: scheduled_plan
    type: table
    fields: [scheduled_job.status_detail, look.title, dashboard.title, scheduled_job.count]
    filters:
      scheduled_job.status: failure
    sorts: [scheduled_job.count desc]
    limit: 500
    dynamic_fields: [{table_calculation: content_name, label: Content Name, expression: "if(is_null(${look.title}),\
          \ \n  concat(\"Dashboard title:  \", ${dashboard.title}),\n  concat(\"Look\
          \ title:  \", ${look.title})\n  )", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: string}]
    query_timezone: UTC
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: [look.title, dashboard.title]
    listen: {}
    row: 28
    col: 14
    width: 10
    height: 9
  - title: Content Recommended to Delete
    name: Content Recommended to Delete
    model: system__activity
    explore: content_usage
    type: table
    fields: [content_usage.content_id, content_usage.embed_total, content_usage.favorites_total,
      content_usage.schedule_total, content_usage.other_total, content_usage.content_title,
      content_usage.content_type, content_usage.last_accessed_date]
    filters:
      content_usage.days_since_last_accessed: ">90"
    sorts: [content_usage.other_total desc]
    limit: 1000
    dynamic_fields: [{table_calculation: content_title, label: Content Title, expression: 'concat(coalesce(${dashboard.title},
          ""), coalesce(${look.title}, ""))', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: string, is_disabled: true}]
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: low to high, value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: White to Green, colors: ["#FFFFFF",
            "#4FBC89"], __FILE: SSO_demo/performance_dash.dashboard.lookml, __LINE_NUM: 248},
        bold: false, italic: false, strikethrough: false, fields: [], __FILE: SSO_demo/performance_dash.dashboard.lookml,
        __LINE_NUM: 247}, {type: low to high, value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: White to Green, colors: ["#FFFFFF",
            "#4FBC89"], __FILE: SSO_demo/performance_dash.dashboard.lookml, __LINE_NUM: 253},
        bold: false, italic: false, strikethrough: false, fields: [], __FILE: SSO_demo/performance_dash.dashboard.lookml,
        __LINE_NUM: 252}, {type: low to high, value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: White to Green, colors: ["#FFFFFF",
            "#4FBC89"], __FILE: SSO_demo/performance_dash.dashboard.lookml, __LINE_NUM: 257},
        bold: false, italic: false, strikethrough: false, fields: [], __FILE: SSO_demo/performance_dash.dashboard.lookml,
        __LINE_NUM: 256}, {type: low to high, value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: White to Green, colors: ["#FFFFFF",
            "#4FBC89"], __FILE: SSO_demo/performance_dash.dashboard.lookml, __LINE_NUM: 261},
        bold: false, italic: false, strikethrough: false, fields: [], __FILE: SSO_demo/performance_dash.dashboard.lookml,
        __LINE_NUM: 260}, {type: low to high, value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: White to Green, colors: ["#FFFFFF",
            "#4FBC89"], __FILE: SSO_demo/performance_dash.dashboard.lookml, __LINE_NUM: 265},
        bold: false, italic: false, strikethrough: false, fields: [], __FILE: SSO_demo/performance_dash.dashboard.lookml,
        __LINE_NUM: 264}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [content_usage.content_id]
    note_state: collapsed
    note_display: hover
    note_text: All time counts for content that have been accessed within the last
      30 days.
    listen: {}
    row: 54
    col: 0
    width: 8
    height: 6
  - title: Explore Usage
    name: Explore Usage
    model: system__activity
    explore: history
    type: table
    fields: [query.view, query.model, history.query_run_count, user.count]
    filters:
      history.source: Explore
    sorts: [history.query_run_count desc, query.model 0]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      user.count: User Count
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 28
    col: 0
    width: 14
    height: 9
  - title: Explores with Queries > 60 days
    name: Explores with Queries > 60 days
    model: system__activity
    explore: history
    type: table
    fields: [history.count, history.most_recent_query_date, query.view]
    filters:
      history.most_recent_query_date: before 60 days ago
      query.model: main
    sorts: [history.count desc]
    limit: 500
    query_timezone: UTC
    listen: {}
    row: 45
    col: 0
    width: 13
    height: 9
  - title: Queries Per Source (past 7 days)
    name: Queries Per Source (past 7 days)
    model: system__activity
    explore: history
    type: table
    fields: [history.query_run_count, history.created_day_of_week, history.source]
    pivots: [history.source]
    filters:
      history.created_date: 7 days
    sorts: [history.query_run_count desc 0, history.source]
    limit: 500
    query_timezone: UTC
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: high to low, value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"], __FILE: SSO_demo/performance_dash.dashboard.lookml,
          __LINE_NUM: 26}, bold: false, italic: false, strikethrough: false, fields: !!null '',
        __FILE: SSO_demo/performance_dash.dashboard.lookml, __LINE_NUM: 25}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 6
  - title: Queries per User (past 1 day)
    name: Queries per User (past 1 day)
    model: system__activity
    explore: history
    type: table
    fields: [history.query_run_count, user.name, history.created_hour_of_day]
    pivots: [user.name]
    filters:
      history.created_date: 1 days
    sorts: [user.name 0, history.created_hour_of_day]
    limit: 500
    query_timezone: UTC
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: high to low, value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"], __FILE: SSO_demo/performance_dash.dashboard.lookml,
          __LINE_NUM: 120}, bold: false, italic: false, strikethrough: false, fields: [],
        __FILE: SSO_demo/performance_dash.dashboard.lookml, __LINE_NUM: 119}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 13
    col: 0
    width: 24
    height: 8
  - title: Queries per Source (past 1 day)
    name: Queries per Source (past 1 day)
    model: system__activity
    explore: history
    type: table
    fields: [history.query_run_count, history.source, history.created_hour_of_day]
    pivots: [history.source]
    filters:
      history.created_date: 1 days
    sorts: [history.source 0, history.created_hour_of_day]
    limit: 500
    query_timezone: UTC
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: high to low, value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"], __FILE: SSO_demo/performance_dash.dashboard.lookml,
          __LINE_NUM: 57}, bold: false, italic: false, strikethrough: false, fields: [],
        __FILE: SSO_demo/performance_dash.dashboard.lookml, __LINE_NUM: 56}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 6
    col: 0
    width: 24
    height: 7
  - title: Queries per User (past 7 days)
    name: Queries per User (past 7 days)
    model: system__activity
    explore: history
    type: table
    fields: [history.query_run_count, history.created_day_of_week, user.name]
    pivots: [user.name]
    fill_fields: [history.created_day_of_week]
    filters:
      history.created_date: 7 days
    sorts: [history.query_run_count desc 0, user.name]
    limit: 500
    query_timezone: UTC
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: high to low, value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"], __FILE: SSO_demo/performance_dash.dashboard.lookml,
          __LINE_NUM: 89}, bold: false, italic: false, strikethrough: false, fields: !!null '',
        __FILE: SSO_demo/performance_dash.dashboard.lookml, __LINE_NUM: 88}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 21
    col: 0
    width: 24
    height: 7
  - title: BAD DASHBOARDS!!!
    name: BAD DASHBOARDS!!!
    model: system__activity
    explore: dashboard
    type: table
    fields: [dashboard.id, dashboard.link, dashboard_element.count, query.count_of_explores]
    filters:
      dashboard_element.count: ">30"
      dashboard.deleted_date: 'NULL'
    sorts: [dashboard_element.count desc]
    limit: 500
    query_timezone: America/New_York
    listen: {}
    row: 37
    col: 0
    width: 13
    height: 8
