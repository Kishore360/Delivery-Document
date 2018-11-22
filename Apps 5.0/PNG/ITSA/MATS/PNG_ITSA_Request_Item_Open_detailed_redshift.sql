select 'ldb.f_request_item' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
union
select'ldb.d_internal_contact' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_internal_contact       a12
on (a11.opened_by_key = a12.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_internal_contact_assigned_to       a13
on (a11.assigned_to_key = a13.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key = a14.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_calendar_date       a15
on (a11.opened_on_key = a15.row_key)
union
select'ldb.d_master_item' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_master_item       a16
on (a11.catalog_item_key = a16.row_key)
union
select'ldb.d_request_item' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_request_item       a17
on (a11.request_item_key = a17.row_key)
union
select'ldb.d_request' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_request       a18
on (a11.request_key = a18.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
  join ldb.d_internal_contact       a12
on (a11.opened_by_key = a12.row_key)
join ldb.d_internal_organization_department       a19
on (a12.department_key = a19.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11
 join ldb.d_internal_contact       a12
on (a11.opened_by_key = a12.row_key)
join ldb.d_internal_contact_mdm       a110
on (a12.row_current_key = a110.row_current_key)
union
select'ldb.d_hr_change_category' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_hr_change_category       a111
on (a11.hr_category_src_key = a111.row_key)
union
select'ldb.d_hr_change' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_hr_change       a112
on (a11.hr_change_key = a112.row_key)
union
select'ldb.d_location' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_location       a113
on (a11.location_key = a113.row_key)
union
select'ldb.d_sc_req_item_approval' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_sc_req_item_approval       a114
on (a11.approval_state_src_key = a114.row_key)
union
select'ldb.d_request_item_contacttype' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_request_item_contacttype       a115
on (a11.reported_type_src_key = a115.row_key)
union
select'ldb.d_sc_req_item_impact' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_sc_req_item_impact       a116
on (a11.impact_src_key = a116.row_key)
union
select'ldb.d_sc_req_item_priority' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_sc_req_item_priority       a117
on (a11.priority_src_key = a117.row_key)
union
select'ldb.d_request_item_stage' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_request_item_stage       a118
on (a11.stage_src_key = a118.row_key)
union
select'ldb.d_request_item_state' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_request_item_state       a119
on (a11.state_src_key = a119.row_key)
union
select'ldb.d_sc_req_item_urgency' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_sc_req_item_urgency       a120
on (a11.urgency_src_key = a120.row_key)
union
select'ldb.d_internal_contact_requested_for' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_internal_contact_requested_for       a121
on (a11.requested_for_key = a121.row_key)
union
select'ldb.d_internal_contact_task_closed_by' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
join ldb.d_internal_contact_task_closed_by       a122
on (a11.closed_by_key = a122.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11
 join ldb.d_calendar_date       a15
on (a11.opened_on_key = a15.row_key)
join ldb.d_calendar_month       a123
on (a15.month_start_date_key = a123.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
 join ldb.d_calendar_date       a15
on (a11.opened_on_key = a15.row_key)
join ldb.d_calendar_week       a124
on (a15.week_start_date_key = a124.row_key)
union
select'ldb.d_request_location' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11
 join ldb.d_request       a18
on (a11.request_key = a18.row_key)
join ldb.d_request_location       a125
on (a18.location_key = a125.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
 join ldb.d_calendar_date       a15
on (a11.opened_on_key = a15.row_key)
join ldb.d_calendar_quarter       a126
on (a15.quarter_start_date_key = a126.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(1) Row_Count
 from  ldb.f_request_item       a11 
 join ldb.d_calendar_date       a15
on (a11.opened_on_key = a15.row_key)
join ldb.d_calendar_year       a127
on (a15.year_start_date_key = a127.row_key)
UNION 
SELECT 'd_calendar_date_fiscal' as Table_Name,Count(1) as Row_Count
FROM ldb.f_request_item a
JOIN ldb.d_calendar_date_fiscal b ON a.opened_on_key=b.row_key
UNION 
SELECT 'd_calendar_fiscal_quarter' as Table_Name,Count(1) as Row_Count
FROM ldb.f_request_item a
JOIN ldb.d_calendar_date_fiscal b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_fiscal_quarter c ON b.quarter_start_date_key=c.row_key
UNION 
SELECT 'd_calendar_fiscal_year' as Table_Name,Count(1) as Row_Count
FROM ldb.f_request_item a
JOIN ldb.d_calendar_date_fiscal b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_fiscal_year c ON b.year_start_date_key=c.row_key
UNION 
SELECT 'd_lov_ritm_category_c' as Table_Name,Count(1) as Row_Count
FROM ldb.f_request_item a
JOIN ldb.d_request_item b ON a.request_item_key=b.row_key
JOIN ldb.d_lov_ritm_category_c c ON b.ritm_category_c_key=c.row_key
UNION 
SELECT 'd_lov_ritm_closure_code_c' as Table_Name,Count(1) as Row_Count
FROM ldb.f_request_item a
JOIN ldb.d_request_item b ON a.request_item_key=b.row_key
JOIN ldb.d_lov_ritm_closure_code_c c ON b.ritm_itsm_closure_code_c_key=c.row_key
UNION 
SELECT 'd_lov_ritm_cwt_c' as Table_Name,Count(1) as Row_Count
FROM ldb.f_request_item a
JOIN ldb.d_request_item b ON a.request_item_key=b.row_key
JOIN ldb.d_lov_ritm_cwt_c c ON b.ritm_itsm_cwt_c_key=c.row_key
UNION 
SELECT 'd_lov_ritm_requesttype_c' as Table_Name,Count(1) as Row_Count
FROM ldb.f_request_item a
JOIN ldb.d_request_item b ON a.request_item_key=b.row_key
JOIN ldb.d_lov_ritm_requesttype_c c ON b.ritm_request_type_c_key=c.row_key
UNION 
SELECT 'd_lov_ritm_servicetype_c' as Table_Name,Count(1) as Row_Count
FROM ldb.f_request_item a
JOIN ldb.d_request_item b ON a.request_item_key=b.row_key
JOIN ldb.d_lov_ritm_servicetype_c c ON b.ritm_service_type_c_key=c.row_key
UNION 
SELECT 'd_lov_ritm_subcategory_c' as Table_Name,Count(1) as Row_Count
FROM ldb.f_request_item a
JOIN ldb.d_request_item b ON a.request_item_key=b.row_key
JOIN ldb.d_lov_ritm_subcategory_c c ON b.ritm_sub_category_c_key=c.row_key
UNION 
select 'ldb.d_internal_organization_group' as Table_Name, count(1) Row_Count
from  ldb.f_request_item a 
JOIN ldb.d_internal_organization_group b on (a.assignment_group_key = b.row_key)
JOIN ldb.d_internal_contact_assignment_group_delegate_c c ON b.pg_delegate_c_key=c.row_key

