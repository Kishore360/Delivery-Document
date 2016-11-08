select'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_calendar_date       a12
on (a11.opened_on_key = a12.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_location       a13
on (a11.location_key = a13.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_contact       a14
on (a11.opened_by_key = a14.row_key)
union
select'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_calendar_time       a15
on (a11.opened_time_key = a15.row_key)
union
select'ldb.dh_assignment_group_tier_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.dh_assignment_group_tier_hierarchy       a16
on (a11.assignment_group_key = a16.user_group_tier_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_configuration_item       a17
on (a11.configuration_item_key = a17.row_key)
union
select'ldb.d_internal_organization_group_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_group_c       a18
on (a11.assignment_group_key = a18.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_internal_contact       a14
on (a11.opened_by_key = a14.row_key)
join ldb.d_internal_contact_mdm       a19
on (a14.row_current_key = a19.row_current_key)
union
select'ldb.d_employee_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
  join ldb.d_internal_contact       a14
on (a11.opened_by_key = a14.row_key)
join ldb.d_internal_contact_mdm       a19
on (a14.row_current_key = a19.row_current_key)
join ldb.d_employee_location       a110
on (a19.location_key = a110.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident       a111
on (a11.incident_key = a111.row_key)
union
select'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a111
on (a11.incident_key = a111.row_key)
join ldb.d_incident_state       a112
on (a111.state_src_key = a112.row_key)
union
select'ldb.d_location_clean_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11
 join ldb.d_location       a13
on (a11.location_key = a13.row_key)
join ldb.d_location_clean_c       a113
on (a13.location_number = a113.clean_location)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_contact_assigned_to       a114
on (a11.assigned_to_key = a114.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_group       a115
on (a11.assignment_group_key = a115.row_key)
union
select'ldb.d_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_legalentity       a116
on (a11.company_key = a116.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_department       a117
on (a11.opened_by_department_key = a117.row_key)
union
select'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_time       a15
on (a11.opened_time_key = a15.row_key)
join ldb.d_calendar_time_hour       a118
on (a15.hour_24_format_num = a118.hour_24_format_num)
union
select'ldb.d_task_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_task_impact       a119
on (a11.impact_src_key = a119.row_key)
union
select'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_task_priority       a120
on (a11.priority_src_key = a120.row_key)
union
select'ldb.d_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_task_contacttype       a121
on (a11.reported_type_src_key = a121.row_key)
union
select'ldb.d_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_task_urgency       a122
on (a11.urgency_src_key = a122.row_key)
union
select'ldb.d_assignment_group_director_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_internal_organization_group_c       a18
on (a11.assignment_group_key = a18.row_key)
join ldb.d_assignment_group_director_c       a123
on (a18.director_c_key = a123.director_c_key)
union
select'ldb.d_assignment_group_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_internal_organization_group_c       a18
on (a11.assignment_group_key = a18.row_key)
join ldb.d_assignment_group_manager_c       a128
on (a18.manager_c_key = a128.manager_c_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_date       a12
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_month       a129
on (a12.month_start_date_key = a129.row_key)
union
select'ldb.d_incident_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a111
on (a11.incident_key = a111.row_key)
join ldb.d_incident_category       a124
on (a111.category_src_key = a124.row_key)
union
select'ldb.d_incident_close_code' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11
 join ldb.d_incident       a111
on (a11.incident_key = a111.row_key)
join ldb.d_incident_close_code       a125
on (a111.close_code_src_key = a125.row_key)
union
select'ldb.d_incident_severity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11
 join ldb.d_incident       a111
on (a11.incident_key = a111.row_key)
join ldb.d_incident_severity       a126
on (a111.severity_src_key = a126.row_key)
union
select'ldb.d_incident_subcategory' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_incident       a111
on (a11.incident_key = a111.row_key)
join ldb.d_incident_subcategory       a127
on (a111.sub_category_src_key = a127.row_key)








