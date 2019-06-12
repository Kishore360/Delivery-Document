select 'ldb.f_asset_activity_c a11 ' as Table_name, count(a11.row_key) Row_Count

from ldb.f_asset_activity_c a11

union

select 'ldb.f_agent_log_c a12 ' as Table_name, count(a11.row_key) Row_Count

from ldb.f_asset_activity_c a11

join ldb.f_agent_log_c a12

on (a11.source_id = a12.source_id)

union

select 'ldb.d_asset a13 ' as Table_name, count(a11.row_key) Row_Count

from ldb.f_asset_activity_c a11

join ldb.d_asset a13

on (a11.asset_key = a13.row_key)

union

select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count

from ldb.f_asset_activity_c a11

join ldb.d_internal_contact_assigned_to a14

on (a11.assigned_to_key = a14.row_key)

union

select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count

from ldb.f_asset_activity_c a11

join ldb.f_agent_log_c a12

on (a11.source_id = a12.source_id)

join ldb.d_calendar_date a15

on (a12.start_time_c_key = a15.row_key)

union

select 'ldb.d_calendar_month a16 ' as Table_name, count(a11.row_key) Row_Count

from ldb.f_asset_activity_c a11

join ldb.f_agent_log_c a12

on (a11.source_id = a12.source_id) join ldb.d_calendar_date a15

on (a12.start_time_c_key = a15.row_key)

join ldb.d_calendar_month a16

on (a15.month_start_date_key = a16.row_key)

union

select 'ldb.d_calendar_quarter a17 ' as Table_name, count(a11.row_key) Row_Count

from ldb.f_asset_activity_c a11

join ldb.f_agent_log_c a12

on (a11.source_id = a12.source_id) join ldb.d_calendar_date a15

on (a12.start_time_c_key = a15.row_key) join ldb.d_calendar_month a16

on (a15.month_start_date_key = a16.row_key)

join ldb.d_calendar_quarter a17

on (a16.quarter_start_date_key = a17.row_key)

union

select 'ldb.d_calendar_week a18 ' as Table_name, count(a11.row_key) Row_Count

from ldb.f_asset_activity_c a11

join ldb.f_agent_log_c a12

on (a11.source_id = a12.source_id) join ldb.d_calendar_date a15

on (a12.start_time_c_key = a15.row_key)

join ldb.d_calendar_week a18

on (a15.week_start_date_key = a18.row_key)

union

select 'ldb.d_calendar_year a19 ' as Table_name, count(a11.row_key) Row_Count

from ldb.f_asset_activity_c a11

join ldb.f_agent_log_c a12

on (a11.source_id = a12.source_id) join ldb.d_calendar_date a15

on (a12.start_time_c_key = a15.row_key) join ldb.d_calendar_month a16

on (a15.month_start_date_key = a16.row_key) join ldb.d_calendar_quarter a17

on (a16.quarter_start_date_key = a17.row_key)

join ldb.d_calendar_year a19

on (a17.year_start_date_key = a19.row_key)

union

select 'ldb.d_lov_asset_status_c a110 ' as Table_name, count(a11.row_key) Row_Count

from ldb.f_asset_activity_c a11

join ldb.d_lov_asset_status_c a110

on (a11.current_state_key = a110.row_key)

union

select 'ldb.d_product_model a111 ' as Table_name, count(a11.row_key) Row_Count

from ldb.f_asset_activity_c a11

join ldb.d_product_model a111

on (a11.product_model_key = a111.row_key)

union

select 'ldb.d_lov_asset_to_status_c a112 ' as Table_name, count(a11.row_key) Row_Count

from ldb.f_asset_activity_c a11

join ldb.d_lov_asset_to_status_c a112

on (a11.to_state_key = a112.row_key)

union

select 'ldb.d_lov_asset_from_status_c a113 ' as Table_name, count(a11.row_key) Row_Count

from ldb.f_asset_activity_c a11

join ldb.d_lov_asset_from_status_c a113

on (a11.from_state_key = a113.row_key)

union

select 'ldb.d_lov_asset_old_status_c a114 ' as Table_name, count(a11.row_key) Row_Count

from ldb.f_asset_activity_c a11

join ldb.d_lov_asset_old_status_c a114

on (a11.old_state_key = a114.row_key)

union

select 'ldb.o_data_freshness a115 ' as Table_name, count(a11.row_key) Row_Count

from ldb.f_asset_activity_c a11

join ldb.o_data_freshness a115

on (a11.source_id = a115.source_id)

union

select 'ldb.d_internal_organization_assigned_to_department_c a116 ' as Table_name, count(a11.row_key) Row_Count

from ldb.f_asset_activity_c a11

join ldb.d_internal_contact_assigned_to a14

on (a11.assigned_to_key = a14.row_key)

join ldb.d_internal_organization_assigned_to_department_c a116

on (a14.department_key = a116.row_key)

union

select 'ldb.d_location_assigned_to a117 ' as Table_name, count(a11.row_key) Row_Count

from ldb.f_asset_activity_c a11

join ldb.d_internal_contact_assigned_to a14

on (a11.assigned_to_key = a14.row_key)

join ldb.d_location_assigned_to a117

on (a14.location_key = a117.row_key)