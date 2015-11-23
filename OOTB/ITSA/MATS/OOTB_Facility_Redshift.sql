 select'f_facility_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
 union
  select'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
join ldb.d_calendar_date         a12
on (a11.opened_on_key = a12.row_key)
union
select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11
 join ldb.d_calendar_date         a12
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_month         a13
on (a12.month_start_date_key = a13.row_key)
union
select'd_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11
 join ldb.d_calendar_date         a12
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_year         a15
on (a12.year_start_date_key = a15.row_key)
union
  select'd_facility_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
join ldb.d_facility_request         a16
on (a11.facility_request_key = a16.row_key)
union
 select'd_facility_request_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
join ldb.d_facility_request_category         a17
on (a11.category_src_key = a17.row_key)
union
select'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
join ldb.d_internal_contact         a18
on (a11.opened_by_key = a18.row_key)
union
select'd_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
 join ldb.d_internal_contact         a18
on (a11.opened_by_key = a18.row_key)
join ldb.d_internal_contact_mdm         a19
on (a18.row_current_key = a19.row_current_key)
union
select'd_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
join ldb.d_internal_organization_department         a110
on (a11.opened_by_department_key = a110.row_key)
union
select'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
join ldb.d_internal_organization_group         a111
on (a11.assignment_group_key = a111.row_key)
union
select'd_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
join ldb.d_location         a112
on (a11.location_key = a112.row_key)
union
select'd_task_approval' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
join ldb.d_task_approval         a113
on (a11.approval_state_src_key = a113.row_key)
union
select'd_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
join ldb.d_task_contacttype         a114
on (a11.reported_type_src_key = a114.row_key)
union
select'd_task_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11
 join ldb.d_task_impact         a115
on (a11.impact_src_key = a115.row_key)
union
select'd_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11
 join ldb.d_task_priority         a116
on (a11.priority_src_key = a116.row_key)
union
select'd_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11
 join ldb.d_task_urgency         a117
on (a11.urgency_src_key = a117.row_key)
union
select'd_internal_contact_assign' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
join ldb.d_internal_contact         a118
on (a11.assigned_to_key = a118.row_key)
union
select'd_task_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
join ldb.d_task_state         a119
on (a11.state_src_key = a119.row_key)
