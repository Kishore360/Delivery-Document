select 'ldb.f_task_sla_c ' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c        a11 
union
select'ldb.d_internal_organization_group a12' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c        a11 
join ldb.d_internal_organization_group a12       a12
on (a11.assignment_group_key = a12.row_key)
union
select'ldb.d_calendar_date  a13' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c        a11 
join ldb.d_calendar_date  a13       a13
on (a11.date_key = a13.row_key)
union
select'ldb.d_calendar_month a14' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c        a11 
 join ldb.d_calendar_date  a13       a13
on (a11.date_key = a13.row_key)
join ldb.d_calendar_month a14       a14
on (a13.month_start_date_key = a14.row_key)
union
select'ldb.d_calendar_quarter a15' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c        a11 
  join ldb.d_calendar_date  a13       a13
on (a11.date_key = a13.row_key)
join ldb.d_calendar_month a14       a14
on (a13.month_start_date_key = a14.row_key)
join ldb.d_calendar_quarter a15       a15
on (a14.quarter_start_date_key = a15.row_key)
union
select'ldb.d_task_sla_c a16' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c        a11 
join ldb.d_task_sla_c a16       a16
on (a11.sla_row_c_key = a16.row_key)
union
select'ldb.d_calendar_week a17' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c        a11
join ldb.d_calendar_date  a13       a13
on (a11.date_key = a13.row_key) 
join ldb.d_calendar_week a17       a17
on (a13.week_start_date_key = a17.row_key)
union
select'ldb.d_calendar_year a18' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c        a11 
   join ldb.d_calendar_date  a13       a13
on (a11.date_key = a13.row_key)
join ldb.d_calendar_month a14       a14
on (a13.month_start_date_key = a14.row_key)
join ldb.d_calendar_quarter a15       a15
on (a14.quarter_start_date_key = a15.row_key)
join ldb.d_calendar_year a18       a18
on (a15.year_start_date_key = a18.row_key)
union
select'ldb.d_task_sla a19' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c        a11 
join ldb.d_task_sla a19       a19
on (a11.sla_key = a19.row_key)
union
select'ldb.d_task a110' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c        a11 
join ldb.d_task a110       a110
on (a11.task_key = a110.row_key)
union
select'ldb.d_task_state a111' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c        a11
join ldb.d_task a110       a110
on (a11.task_key = a110.row_key) 
join ldb.d_task_state a111       a111
on (a110.state_src_key = a111.row_key)
union
select'ldb.d_internal_contact_assigned_to a112' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c        a11 
join ldb.d_internal_contact_assigned_to a112       a112
on (a11.assigned_to_key = a112.row_key)
union
select'ldb.d_internal_organization_legalentity a113' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c        a11 
join ldb.d_internal_organization_legalentity a113       a113
on (a11.company_key = a113.row_key)
union
select'ldb.d_configuration_item a114' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c        a11 
join ldb.d_configuration_item a114       a114
on (a11.configuration_item_key = a114.row_key)
union
select'ldb.d_task_sla_stage a115' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c        a11 
join ldb.d_task_sla_stage a115       a115
on (a11.stage_src_key = a115.row_key)
union
select'ldb.d_task_sla_name a116' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c        a11
join ldb.d_task_sla a19       a19
on (a11.sla_key = a19.row_key) 
join ldb.d_task_sla_name a116       a116
on (a19.sla_category_key = a116.row_key)
union
select'ldb.d_task_sla_category_c a117' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c        a11 
join ldb.d_task_sla_category_c a117       a117
on (a11.category_src_key = a117.row_key)
union
select'ldb.d_task_contacttype a118' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c        a11
join ldb.d_task a110       a110
on (a11.task_key = a110.row_key) 
join ldb.d_task_contacttype a118       a118
on (a110.contact_type_src_key = a118.row_key)
union
select'ldb.d_task_priority a119' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c        a11
join ldb.d_task a110       a110
on (a11.task_key = a110.row_key) 
join ldb.d_task_priority a119       a119
on (a110.priority_src_key = a119.row_key)
union
select'ldb.d_task_type a120' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_sla_c        a11
join ldb.d_task a110       a110
on (a11.task_key = a110.row_key) 
join ldb.d_task_type a120       a120
on (a110.task_type_src_key = a120.row_key)

