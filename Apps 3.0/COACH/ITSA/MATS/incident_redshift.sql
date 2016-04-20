SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select'ldb.f_incident_closed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
union
select'ldb.d_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_internal_organization_legalentity       a12
on (a11.company_key = a12.row_key)
union
select'ldb.d_customer' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_customer       a13
on (a11.customer_key = a13.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_internal_contact       a14
on (a11.closed_by_key = a14.row_key)
union
select'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_calendar_time       a15
on (a11.opened_time_key = a15.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_incident       a16
on (a11.incident_key = a16.row_key)
union
select'ldb.dh_assignment_group_tier_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.dh_assignment_group_tier_hierarchy       a17
on (a11.assignment_group_key = a17.user_group_tier_key)
union
select'ldb.dh_assignment_group_type_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.dh_assignment_group_type_hierarchy       a18
on (a11.assignment_group_key = a18.user_group_type_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_configuration_item       a19
on (a11.configuration_item_key = a19.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_calendar_date       a110
on (a11.closed_on_key = a110.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_internal_contact       a111
on (a11.assigned_to_key = a111.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_internal_organization_group       a112
on (a11.assignment_group_key = a112.row_key)
union
select'ldb.d_customer_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
 JOIN ldb.d_customer	       a13	on (a11.customer_key = a13.row_key)
join ldb.d_customer_mdm       a113
on (a13.row_current_key = a113.row_current_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_internal_organization_department       a114
on (a11.opened_by_department_key = a114.row_key)
union
select'ldb.d_detail_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_detail_c       a115
on (a11.detail_c_key = a115.row_key)
union
select'ldb.d_domain' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_domain       a116
on (a11.domain_key = a116.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 join ldb.d_internal_contact	       a14	ON (a11.closed_by_key = a14.row_key)
join ldb.d_internal_contact_mdm       a117
on (a14.row_current_key = a117.row_current_key)
union
select'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 join ldb.d_calendar_time	       a15 on	(a11.opened_time_key = a15.row_key)
join ldb.d_calendar_time_hour       a118
on (a15.hour_24_format_num = a118.hour_24_format_num)
union
select'ldb.d_incident_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_incident_category       a119
on (a11.category_src_key = a119.row_key)
union
select'ldb.d_incident_close_code' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_incident_close_code       a120
on (a11.close_code_src_key = a120.row_key)
union
select'ldb.d_incident_severity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_incident_severity       a121
on (a11.severity_src_key = a121.row_key)
union
select'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_incident_state       a122
on (a11.state_src_key = a122.row_key)
union
select'ldb.d_incident_subcategory' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_incident_subcategory       a123
on (a11.sub_category_src_key = a123.row_key)
union
select'ldb.d_parent_location_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_parent_location_c       a124
on (a11.parent_location_c_key = a124.row_key)
union
select'ldb.d_task_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_task_impact       a125
on (a11.impact_src_key = a125.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_location       a126
on (a11.location_key = a126.row_key)
union
select'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_task_priority       a127
on (a11.priority_src_key = a127.row_key)
union
select'ldb.d_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_task_contacttype       a128
on (a11.reported_type_src_key = a128.row_key)
union
select'ldb.d_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_task_urgency       a129
on (a11.urgency_src_key = a129.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_closed       a11 
join ldb.d_calendar_date	a110     on  	(a11.closed_on_key = a110.row_key)
join ldb.d_calendar_month       a130
on (a110.month_start_date_key = a130.row_key)
)a)b
