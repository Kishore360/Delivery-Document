select 'ldb.f_agent_call_summary_aux' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary_aux       a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary_aux       a11 
join ldb.d_internal_contact       a12
on (a11.employee_key=a12.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary_aux       a11 
join ldb.d_calendar_date       a13
on (a11.day_key=a13.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary_aux       a11 
 join ldb.d_calendar_date       a13
on (a11.day_key=a13.row_key)
join ldb.d_calendar_month       a14
on (a13.month_start_date_key=a14.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary_aux       a11 
 join ldb.d_calendar_date       a13
on (a11.day_key=a13.row_key)
join ldb.d_calendar_week       a15
on (a13.week_start_date_key=a15.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary_aux       a11 
 join ldb.d_calendar_date       a13
on (a11.day_key=a13.row_key)
join ldb.d_calendar_year       a16
on (a13.year_start_date_key=a16.row_key)
union
select'ldb.d_skill' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary_aux       a11 
join ldb.d_skill       a17
on (a11.skill_key=a17.row_key)
union
select'ldb.dh_skill_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary_aux       a11 
 join ldb.d_skill       a17
on (a11.skill_key=a17.row_key)
join ldb.dh_skill_hierarchy       a18
on (a17.row_key=a18.lev_0_key)
union
select'ldb.d_acd' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary_aux       a11 
join ldb.d_acd       a19
on (a11.acd_key=a19.row_key)
union
select'ldb.d_cost_center' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary_aux       a11 
join ldb.d_cost_center       a110
on (a11.cost_center_key=a110.row_key)
union
select'ldb.d_source' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary_aux       a11 
join ldb.d_source       a111
on (a11.source_id=a111.source_id)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary_aux       a11 
 join ldb.d_internal_contact       a12
on (a11.employee_key=a12.row_key)
join ldb.d_internal_contact_mdm       a112
on (a12.row_current_key=a112.row_current_key)
union
select'ldb.d_group_lvl' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary_aux       a11 
join ldb.d_group_lvl       a113
on (a11.group_lvl_key=a113.row_key)
union
select'ldb.d_location' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary_aux       a11 
join ldb.d_location       a114
on (a11.location_key=a114.row_key)
union
select'ldb.dh_skill_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary_aux       a11 
 join ldb.d_skill       a17
on (a11.skill_key=a17.row_key)
join ldb.dh_skill_hierarchy       a18
on (a17.row_key=a18.lev_0_key)
join ldb.dh_skill_level1       a115
on (a18.lev_1_key=a115.row_key)
union
select'ldb.dh_skill_level2' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary_aux       a11 
 join ldb.d_skill       a17
on (a11.skill_key=a17.row_key)
join ldb.dh_skill_hierarchy       a18
on (a17.row_key=a18.lev_0_key)
join ldb.dh_skill_level2       a116
on (a18.lev_2_key=a116.row_key)
union
select'ldb.dh_skill_level3' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary_aux       a11 
 join ldb.d_skill       a17
on (a11.skill_key=a17.row_key)
join ldb.dh_skill_hierarchy       a18
on (a17.row_key=a18.lev_0_key)
join ldb.dh_skill_level3       a117
on (a18.lev_3_key=a117.row_key)
union
select'ldb.dh_skill_level4' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_agent_call_summary_aux       a11 
 join ldb.d_skill       a17
on (a11.skill_key=a17.row_key)
join ldb.dh_skill_hierarchy       a18
on (a17.row_key=a18.lev_0_key)
join ldb.dh_skill_level4       a118
on (a18.lev_4_key=a118.row_key)




