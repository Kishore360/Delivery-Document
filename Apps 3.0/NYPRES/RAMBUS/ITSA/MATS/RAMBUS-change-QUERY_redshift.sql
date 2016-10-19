SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select'ldb.f_change_request_closed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_internal_organization_department       a12
on (a11.requested_by_department_key = a12.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_internal_contact       a13
on (a11.opened_by_key = a13.row_key)
union
select'ldb.d_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request       a14
on (a11.change_request_key = a14.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_calendar_date       a15
on (a11.closed_on_key = a15.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_internal_contact       a16
on (a11.assigned_to_key = a16.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_internal_organization_group       a17
on (a11.assignment_group_key = a17.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_configuration_item       a18
on (a11.business_service_c_key = a18.row_key)
union
select'ldb.d_change_request_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_category       a19
on (a11.category_src_key = a19.row_key)
union
select'ldb.d_change_request_reason' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_reason       a110
on (a11.reason_src_key = a110.row_key)
union
select'ldb.d_change_request_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_state       a111
on (a11.state_src_key = a111.row_key)
union
select'ldb.d_change_request_review_status' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_review_status       a112
on (a11.review_status_src_key = a112.row_key)
union
select'ldb.d_change_request_risk' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_risk       a113
on (a11.risk_src_key = a113.row_key)
union
select'ldb.d_change_request_scope' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_scope       a114
on (a11.scope_src_key = a114.row_key)
union
select'ldb.d_change_request_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_type       a115
on (a11.type_src_key = a115.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_configuration_item       a116
on (a11.configuration_item_key = a116.row_key)
union
select'ldb.d_domain' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_domain       a117
on (a11.domain_key = a117.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
 join ldb.d_internal_contact	       a13	
 ON (a11.opened_by_key = a13.row_key)
join ldb.d_internal_contact_mdm       a118
on (a13.row_current_key = a118.row_current_key)
union
select'ldb.d_change_request_implementation_state_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_implementation_state_c       a119
on (a11.implementation_state_src_c_key = a119.row_key)
union
select'ldb.d_change_request_souce_of_change' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_souce_of_change       a120
on (a11.souce_of_change_src_c_key = a120.row_key)
union
select'ldb.d_change_request_subcategory' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_change_request_subcategory       a121
on (a11.sub_category_src_c_key = a121.row_key)
union
select'ldb.d_task_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_task_impact       a122
on (a11.impact_src_key = a122.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_location       a123
on (a11.location_key = a123.row_key)
union
select'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_task_priority       a124
on (a11.priority_src_key = a124.row_key)
union
select'ldb.d_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_task_contacttype       a125
on (a11.reported_type_src_key = a125.row_key)
union
select'ldb.d_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
join ldb.d_task_urgency       a126
on (a11.urgency_src_key = a126.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
 JOIN ldb.d_calendar_date	       a15 ON	(a11.closed_on_key = a15.row_key)
join ldb.d_calendar_month       a127
on (a15.month_start_date_key = a127.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
 JOIN ldb.d_calendar_date	       a15 ON	(a11.closed_on_key = a15.row_key)
join ldb.d_calendar_quarter       a128
on (a15.quarter_start_date_key = a128.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_change_request_closed       a11 
 JOIN ldb.d_calendar_date	       a15 ON	(a11.closed_on_key = a15.row_key)
join ldb.d_calendar_year       a129
on (a15.year_start_date_key = a129.row_key)
)a
)b