select 'ldb.f_request_item a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_internal_contact a12 
 on (a11.employee_key = a12.row_key)  
union
select 'ldb.d_internal_contact_assigned_to a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_internal_contact_assigned_to a13 
 on (a11.assigned_to_key = a13.row_key)  
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_internal_organization_group a14 
 on (a11.assignment_group_key = a14.row_key)  
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_calendar_date a15 
 on (a11.date_key = a15.row_key)  
union
select 'ldb.d_calendar_month a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_calendar_date a15 
 on (a11.date_key = a15.row_key) 
 join ldb.d_calendar_month a16 
 on (a15.month_start_date_key = a16.row_key)  
union
select 'ldb.d_calendar_quarter a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_calendar_date a15 
 on (a11.date_key = a15.row_key)join ldb.d_calendar_month a16 
 on (a15.month_start_date_key = a16.row_key) 
 join ldb.d_calendar_quarter a17 
 on (a16.quarter_start_date_key = a17.row_key)  
union
select 'ldb.d_master_item a18 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_master_item a18 
 on (a11.catalog_item_key = a18.row_key)  
union
select 'ldb.d_request_item a19 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_request_item a19 
 on (a11.request_item_key = a19.row_key)  
union
select 'ldb.d_request a110 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_request a110 
 on (a11.request_key = a110.row_key)  
union
select 'ldb.d_internal_contact_task_closed_by a111 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_internal_contact_task_closed_by a111 
 on (a11.closed_by_key = a111.row_key)  
union
select 'ldb.d_internal_organization_department a112 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_internal_contact a12 
 on (a11.employee_key = a12.row_key) 
 join ldb.d_internal_organization_department a112 
 on (a12.department_key = a112.row_key)  
union
select 'ldb.d_internal_contact_mdm a113 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_internal_contact a12 
 on (a11.employee_key = a12.row_key) 
 join ldb.d_internal_contact_mdm a113 
 on (a12.employee_mdm_key = a113.row_key)  
union
select 'ldb.d_hr_change_category a114 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_hr_change_category a114 
 on (a11.hr_category_src_key = a114.row_key)  
union
select 'ldb.d_hr_change a115 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_hr_change a115 
 on (a11.hr_change_key = a115.row_key)  
union
select 'ldb.d_location a116 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_location a116 
 on (a11.location_key = a116.row_key)  
union
select 'ldb.d_sc_req_item_approval a117 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_sc_req_item_approval a117 
 on (a11.approval_state_src_key = a117.row_key)  
union
select 'ldb.d_request_item_contacttype a118 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_request_item_contacttype a118 
 on (a11.reported_type_src_key = a118.row_key)  
union
select 'ldb.d_sc_req_item_impact a119 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_sc_req_item_impact a119 
 on (a11.impact_src_key = a119.row_key)  
union
select 'ldb.d_sc_req_item_priority a120 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_sc_req_item_priority a120 
 on (a11.priority_src_key = a120.row_key)  
union
select 'ldb.d_request_item_stage a121 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_request_item_stage a121 
 on (a11.stage_src_key = a121.row_key)  
union
select 'ldb.d_request_item_state a122 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_request_item_state a122 
 on (a11.state_src_key = a122.row_key)  
union
select 'ldb.d_sc_req_item_urgency a123 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_sc_req_item_urgency a123 
 on (a11.urgency_src_key = a123.row_key)  
union
select 'ldb.d_internal_contact_requested_for a124 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_internal_contact_requested_for a124 
 on (a11.requested_for_key = a124.row_key)  
union
select 'ldb.d_calendar_week a125 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_calendar_date a15 
 on (a11.date_key = a15.row_key) 
 join ldb.d_calendar_week a125 
 on (a15.week_start_date_key = a125.row_key)  
union
select 'ldb.d_request_location a126 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_request a110 
 on (a11.request_key = a110.row_key) 
 join ldb.d_request_location a126 
 on (a110.location_key = a126.row_key)  
union
select 'ldb.d_calendar_year a127 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_request_item a11 
 join ldb.d_calendar_date a15 
 on (a11.date_key = a15.row_key)join ldb.d_calendar_month a16 
 on (a15.month_start_date_key = a16.row_key)join ldb.d_calendar_quarter a17 
 on (a16.quarter_start_date_key = a17.row_key) 
 join ldb.d_calendar_year a127 
 on (a17.year_start_date_key = a127.row_key)  

