select 'ldb.f_task_sla_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c a11 
union
select'ldb.d_internal_organization_group ' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c a11 
join ldb.d_internal_organization_group a12
on (a11.assignment_group_key=a12.row_key)
union
select'ldb.d_calendar_date ' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c a11 
join ldb.d_calendar_date a13
on (a11.date_key=a13.row_key)
union
select'ldb.d_calendar_month ' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c a11
join ldb.d_calendar_date a13
on (a11.date_key=a13.row_key) 
join ldb.d_calendar_month a14
on (a13.month_start_date_key=a14.row_key)
union
select'ldb.d_calendar_quarter ' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c a11
 join ldb.d_calendar_date a13
on (a11.date_key=a13.row_key) 
join ldb.d_calendar_month a14
on (a13.month_start_date_key=a14.row_key) 
join ldb.d_calendar_quarter a15
on (a14.quarter_start_date_key=a15.row_key)
union
select'ldb.d_task_sla_c ' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c a11 
join ldb.d_task_sla_c a16
on (a11.sla_row_c_key=a16.row_key)
union
select'ldb.d_calendar_week ' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c a11 
 join ldb.d_calendar_date a13
on (a11.date_key=a13.row_key)
join ldb.d_calendar_week a17
on (a13.week_start_date_key=a17.row_key)
union
select'ldb.d_calendar_year ' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c a11 
 join ldb.d_calendar_date a13
on (a11.date_key=a13.row_key) 
join ldb.d_calendar_month a14
on (a13.month_start_date_key=a14.row_key)
 join ldb.d_calendar_quarter a15
on (a14.quarter_start_date_key=a15.row_key)
join ldb.d_calendar_year  a18
on (a15.year_start_date_key=a18.row_key)
union
select'ldb.d_task_sla ' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c a11 
join ldb.d_task_sla a19
on (a11.sla_key=a19.row_key)
union
select'ldb.d_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c a11 
join ldb.d_task a110
on (a11.task_key=a110.row_key)
union
select'ldb.d_task_state ' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c a11 
 join ldb.d_task a110
on (a11.task_key=a110.row_key)
join ldb.d_task_state a111
on (a110.state_src_key=a111.row_key)
union
select'ldb.d_internal_contact_assigned_to ' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c a11 
join ldb.d_internal_contact_assigned_to a112
on (a11.assigned_to_key=a112.row_key)
union
select'ldb.d_internal_organization_legalentity ' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c a11 
join ldb.d_internal_organization_legalentity a113
on (a11.company_key=a113.row_key)
union
select'ldb.d_configuration_item ' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c a11 
join ldb.d_configuration_item a114
on (a11.configuration_item_key=a114.row_key)
union
select'ldb.d_incident_missed_first_pass_reason_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c a11 
join ldb.d_incident_missed_first_pass_reason_c a115
on (a11.incident_first_missed_pass_reason_key_c=a115.row_key)
union
select'ldb.d_incident_resolved_by_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c a11 
join ldb.d_incident_resolved_by_c a116
on (a11.incident_resolved_by_key_c=a116.row_key)
union
select'ldb.d_incident_resolved_by_group_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c a11 
join ldb.d_incident_resolved_by_group_c a117
on (a11.incident_resolved_by_group_key=a117.row_key)
union
select'ldb.d_task_sla_stage ' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c a11 
join ldb.d_task_sla_stage a118
on (a11.stage_src_key=a118.row_key)
union
select'ldb.d_task_sla_name ' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c a11
join ldb.d_task_sla a19
on (a11.sla_key=a19.row_key) 
join ldb.d_task_sla_name a119
on (a19.sla_category_key=a119.row_key)
union
select'ldb.d_task_sla_category_c ' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c a11 
join ldb.d_task_sla_category_c a120
on (a11.category_src_key=a120.row_key)
union
select'ldb.d_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c a11
join ldb.d_task a110
on (a11.task_key=a110.row_key) 
join ldb.d_task_contacttype a121
on (a110.contact_type_src_key=a121.row_key)
union
select'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c a11 
 join ldb.d_task a110
on (a11.task_key=a110.row_key) 
join ldb.d_task_priority a122
on (a110.priority_src_key=a122.row_key)
union
select'ldb.d_task_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c a11 
  join ldb.d_task a110
on (a11.task_key=a110.row_key) 
join ldb.d_task_type a123
on (a110.task_type_src_key=a123.row_key)