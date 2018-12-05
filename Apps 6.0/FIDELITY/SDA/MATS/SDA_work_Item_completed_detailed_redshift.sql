select 'ldb.f_work_item_completed' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11 
join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11 
join ldb.d_calendar_date       a13
on (a11.date_key = a13.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11 
 join ldb.d_calendar_date       a13
on (a11.date_key = a13.row_key)
join ldb.d_calendar_month       a14
on (a13.month_start_date_key = a14.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11 
  join ldb.d_calendar_date       a13
on (a11.date_key = a13.row_key)
join ldb.d_calendar_week       a16
on (a13.week_start_date_key = a16.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11 
  join ldb.d_calendar_date       a13
on (a11.date_key = a13.row_key)
join ldb.d_calendar_month       a14
on (a13.month_start_date_key = a14.row_key)
join ldb.d_calendar_quarter       a15
on (a14.quarter_start_date_key = a15.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11 
   join ldb.d_calendar_date       a13
on (a11.date_key = a13.row_key)
join ldb.d_calendar_month       a14
on (a13.month_start_date_key = a14.row_key)
join ldb.d_calendar_quarter       a15
on (a14.quarter_start_date_key = a15.row_key)
join ldb.d_calendar_year       a17
on (a15.year_start_date_key = a17.row_key)
union
select'ldb.d_work_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11 
join ldb.d_work_item       a18
on (a11.work_item_key = a18.row_key)
union
select'ldb.d_iteration' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11
 join ldb.d_work_item       a18
on (a11.work_item_key = a18.row_key)
join ldb.d_iteration       a19
on (a18.iteration_key = a19.row_key)
union
select'ldb.d_project' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11 
join ldb.d_project       a110
on (a11.project_key = a110.row_key)
union
select'ldb.d_work_item_epic' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11 
 join ldb.d_work_item       a18
on (a11.work_item_key = a18.row_key)
join ldb.d_work_item_epic       a111
on (a18.work_item_epic_key = a111.row_key)
union
select'ldb.d_work_item_earliest_fixed_version' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11 
 join ldb.d_work_item       a18
on (a11.work_item_key = a18.row_key)
join ldb.d_work_item_earliest_fixed_version       a112
on (a18.earliest_fixed_version_key = a112.row_key)
union
select'ldb.d_work_item_status' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11 
 join ldb.d_work_item       a18
on (a11.work_item_key = a18.row_key)
join ldb.d_work_item_status       a113
on (a18.work_item_status_src_key = a113.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11 
join ldb.d_internal_contact_assigned_to       a114
on (a11.work_item_assigned_to_key = a114.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key = a12.row_key)
join ldb.d_internal_contact_mdm       a115
on (a12.employee_mdm_key = a115.row_key)
union
select'ldb.d_project_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11 
 join ldb.d_project       a110
on (a11.project_key = a110.row_key)
join ldb.d_project_category       a116
on (a110.project_category_src_key = a116.row_key)
union
select'ldb.d_project_classification' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11 
 join ldb.d_project       a110
on (a11.project_key = a110.row_key)
join ldb.d_project_classification       a117
on (a110.project_classification_src_key = a117.row_key)
union
select'ldb.d_work_item_closed_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11 
 join ldb.d_work_item       a18
on (a11.work_item_key = a18.row_key)
join ldb.d_work_item_closed_by       a118
on (a18.work_item_closed_by_key = a118.row_key)
union
select'ldb.d_work_item_created_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11
 join ldb.d_work_item       a18
on (a11.work_item_key = a18.row_key)
join ldb.d_work_item_created_by       a119
on (a18.created_by_key = a119.row_key)
union
select'ldb.d_primary_component' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11 
 join ldb.d_work_item       a18
on (a11.work_item_key = a18.row_key)
join ldb.d_primary_component       a120
on (a18.primary_component_key = a120.row_key)
union
select'ldb.d_work_item_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11 
 join ldb.d_work_item       a18
on (a11.work_item_key = a18.row_key)
join ldb.d_work_item_priority       a121
on (a18.work_item_priority_src_key = a121.row_key)
union
select'ldb.d_work_item_reason' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11 
 join ldb.d_work_item       a18
on (a11.work_item_key = a18.row_key)
join ldb.d_work_item_reason       a122
on (a18.work_item_reason_src_key = a122.row_key)
union
select'ldb.d_work_item_reported_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11 
 join ldb.d_work_item       a18
on (a11.work_item_key = a18.row_key)
join ldb.d_work_item_reported_by       a123
on (a18.work_item_reported_by_key = a123.row_key)
union
select'ldb.d_work_item_resolution' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11 
 join ldb.d_work_item       a18
on (a11.work_item_key = a18.row_key)
join ldb.d_work_item_resolution       a124
on (a18.work_item_resolution_src_key = a124.row_key)
union
select'ldb.d_work_item_resolved_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11 
 join ldb.d_work_item       a18
on (a11.work_item_key = a18.row_key)
join ldb.d_work_item_resolved_by       a125
on (a18.work_item_resolved_by_key = a125.row_key)
union
select'ldb.d_work_item_risk' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11 
 join ldb.d_work_item       a18
on (a11.work_item_key = a18.row_key)
join ldb.d_work_item_risk       a126
on (a18.work_item_risk_src_key = a126.row_key)
union
select'ldb.d_work_item_severity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11 
 join ldb.d_work_item       a18
on (a11.work_item_key = a18.row_key)
join ldb.d_work_item_severity       a127
on (a18.work_item_severity_src_key = a127.row_key)
union 
select'ldb.d_work_item_status_category' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11
 join ldb.d_work_item       a18
on (a11.work_item_key = a18.row_key)
join ldb.d_work_item_status_category       a128
on (a18.work_item_status_category_src_key = a128.row_key)
union
select'ldb.d_work_item_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11 
 join ldb.d_work_item       a18
on (a11.work_item_key = a18.row_key)
join ldb.d_work_item_type       a129
on (a18.work_item_type_src_key = a129.row_key)
union
select'ldb.d_work_item_updated_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_work_item_completed       a11 
 join ldb.d_work_item       a18
on (a11.work_item_key = a18.row_key)
join ldb.d_work_item_updated_by       a130
on (a18.work_item_updated_by_key = a130.row_key)

