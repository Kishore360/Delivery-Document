SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select'ldb.f_facility_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
join ldb.d_internal_organization_department         a12
on (a11.opened_by_department_key=a12.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
join ldb.d_internal_contact         a13
on (a11.opened_by_key=a13.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
join ldb.d_calendar_date         a14
on (a11.opened_on_key=a14.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
join ldb.d_internal_contact         a15
on (a11.assigned_to_key=a15.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
join ldb.d_internal_organization_group         a16
on (a11.assignment_group_key=a16.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11
 join ldb.d_internal_contact         a13
on (a11.opened_by_key=a13.row_key)
join ldb.d_internal_contact_mdm         a17
on (a13.row_current_key=a17.row_current_key)
union
select'ldb.d_facility_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
join ldb.d_facility_request         a18
on (a11.facility_request_key=a18.row_key)
union
select'ldb.d_facility_request_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
join ldb.d_facility_request_category         a19
on (a11.category_src_key=a19.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
join ldb.d_location         a110
on (a11.location_key=a110.row_key)
union
select'ldb.d_task_approval' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
join ldb.d_task_approval         a111
on (a11.approval_state_src_key=a111.row_key)
union
select'ldb.d_task_impact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
join ldb.d_task_impact         a112
on (a11.impact_src_key=a112.row_key)
union
select'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
join ldb.d_task_priority         a113
on (a11.priority_src_key=a113.row_key)
union
select'ldb.d_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
join ldb.d_task_contacttype         a114
on (a11.reported_type_src_key=a114.row_key)
union
select'ldb.d_task_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
join ldb.d_task_state         a115
on (a11.state_src_key=a115.row_key)
union
select'ldb.d_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
join ldb.d_task_urgency         a116
on (a11.urgency_src_key=a116.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
 join ldb.d_calendar_date         a14
on (a11.opened_on_key=a14.row_key)
join ldb.d_calendar_month         a117
on (a14.month_start_date_key=a117.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_facility_request             a11 
 join ldb.d_calendar_date         a14
on (a11.opened_on_key=a14.row_key)
join ldb.d_calendar_year         a118
on (a14.year_start_date_key=a118.row_key)
)a
)b

