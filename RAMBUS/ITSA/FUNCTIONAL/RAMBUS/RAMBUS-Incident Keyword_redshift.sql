SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
union
select'ldb.f_incident_keyword' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.f_incident_keyword       a12
on (a11.assignment_group_key = a12.assignment_group_key and 
 a11.configuration_item_key = a12.configuration_item_key and 
 a11.customer_key = a12.customer_key and 
 a11.incident_key = a12.table_row_key and 
 a11.opened_on_key = a12.opened_on_key and 
 a11.priority_src_key = a12.priority_src_key)
union
select'ldb.d_customer' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_customer       a13
on (a11.customer_key = a13.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_department       a14
on (a11.opened_by_department_key = a14.row_key)
union
select'ldb.dh_assignment_group_tier_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.dh_assignment_group_tier_hierarchy       a15
on (a11.assignment_group_key = a15.user_group_tier_key)
union
select'ldb.dh_assignment_group_type_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.dh_assignment_group_type_hierarchy       a16
on (a11.assignment_group_key = a16.user_group_type_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_configuration_item       a17
on (a11.configuration_item_key = a17.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_calendar_date       a18
on (a11.opened_on_key = a18.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident       a19
on (a11.incident_key = a19.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_group       a110
on (a11.assignment_group_key = a110.row_key)
union
select'ldb.d_customer_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_customer	       a13	on (a11.customer_key = a13.row_key)
join ldb.d_customer_mdm       a111
on (a13.row_current_key = a111.row_current_key)
union
select'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_task_priority       a112
on (a11.priority_src_key = a112.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_date	       a18 on	(a11.opened_on_key = a18.row_key)
join ldb.d_calendar_month       a113
on (a18.month_start_date_key = a113.row_key)
)a
)b
