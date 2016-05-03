
SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
select max(Row_Count) max_count,Min(Row_Count) min_count from (
select 'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
union

select 'ldb.d_calendar_time_hour' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_calendar_time         a15
on (a11.opened_time_key = a15.row_key)
join    ldb.d_calendar_time_hour    a115
 on     (a15.hour_24_format_num = a115.hour_24_format_num)
union
select 'ldb.dh_user_group_classification_hierarchy' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.dh_user_group_classification_hierarchy         a17
on (a11.assignment_group_key = a17.user_group_key)
union
select 'ldb.dh_user_group_classification_hierarchy_level1' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.dh_user_group_classification_hierarchy         a17
on (a11.assignment_group_key = a17.user_group_key)
join ldb.dh_user_group_classification_hierarchy_level1         a18
on (a17.user_group_classification_level1 = a18.user_group_level1_key)
union

 
select 'ldb.dh_user_group_classification_hierarchy_level2' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.dh_user_group_classification_hierarchy         a16
on (a11.assignment_group_key = a16.user_group_key)
join    ldb.dh_user_group_classification_hierarchy_level1    a17
 on     (a16.user_group_classification_level1 = a17.user_group_level1_key)
join ldb.dh_user_group_classification_hierarchy_level2         a18
on (a17.user_group_level2_key  = a18.user_group_level2_key)

union
select 'ldb.d_incident_infrastructure_category_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_incident_infrastructure_category_c         a119
on (a11.infrastructure_category_src_c_key = a119.row_key)
union
select 'ldb.d_internal_contact_opened_by_key_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_internal_contact_opened_by_key_c         a120
on (a11.opened_by_c_key = a120.row_key)
union
select 'ldb.d_problem' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_problem         a121
on (a11.problem_key = a121.row_key)
union
select 'ldb.d_incident_symptom_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_incident_symptom_c         a122
on (a11.symptom_src_c_key = a122.row_key)
union
select 'ldb.d_internal_contact_manager_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_internal_contact         a16
on (a11.assigned_to_key = a16.row_key)
join ldb.d_internal_contact_manager_c         a128
on (a16.manager_c_key = a128.row_key)
union
select 'ldb.d_incident_sub_type_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_incident_sub_type_c         a130
on (a11.sub_type_c_key = a130.row_key)
union
select 'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_calendar_date         a15
on (a11.opened_on_key = a15.row_key)

union

select 'd_calendar_date_fiscal' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11
join        ldb.d_calendar_greg_fiscal         a138
                  on  (a11.opened_on_key = a138.gregorian_calendar_key)
                join        ldb.d_calendar_date_fiscal         a139
                  on         (a138.fiscal_calendar_key = a139.row_key)
                                                                  
union
select 'd_calendar_fiscal_period' as Table_Name, count(a162.row_key) Row_Count
from  ldb.f_incident a11
  join        ldb.d_calendar_greg_fiscal         a138
                  on  (a11.opened_on_key  = a138.gregorian_calendar_key)

 join        ldb.d_calendar_date_fiscal         a139
                  on         (a138.fiscal_calendar_key = a139.row_key)
  
 join        ldb.d_calendar_fiscal_period     a162
                  on         (a139.period_start_date_key = a162.row_key)
union

select 'd_calendar_fiscal_quarter' as Table_Name, count(a140.row_key) Row_Count
from  ldb.f_incident a11
    join        ldb.d_calendar_greg_fiscal         a138
                  on         (a11.opened_on_key = a138.gregorian_calendar_key)
                join        ldb.d_calendar_date_fiscal         a139
                  on         (a138.fiscal_calendar_key = a139.row_key)
                join        ldb.d_calendar_fiscal_quarter   a140
                  on         (a139.quarter_start_date_key = a140.row_key)

union 
 
 select 'd_calendar_fiscal_year' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11
join                ldb.d_calendar_greg_fiscal         a138
                  on         (a11.opened_on_key = a138.gregorian_calendar_key)
                join        ldb.d_calendar_date_fiscal         a139
                  on         (a138.fiscal_calendar_key = a139.row_key)
                join        ldb.d_calendar_fiscal_quarter   a140
                  on         (a139.quarter_start_date_key = a140.row_key)
                                                join        ldb.d_calendar_fiscal_year         a163
                  on         (a140.year_start_date_key = a163.row_key)
                                                                  
union
select 'd_calendar_greg_fiscal' as Table_Name, count(1) Row_Count
from  ldb.f_incident a11

 join        ldb.d_calendar_greg_fiscal         a138
                  on (a11.opened_on_key = a138.gregorian_calendar_key)
                
                                                                  
union

select 'd_calendar_month' as Table_Name, count(a16.row_key) Row_Count
from  ldb.f_incident a11
join ldb.d_calendar_date a15
on         (a11.opened_on_key = a15.row_key)
                join        ldb.d_calendar_month a16
                  on         (a15.month_start_date_key = a16.row_key)
union

select 'd_configuration_item' as Table_Name, count(a134.row_key) Row_Count
from  ldb.f_incident a11
join        ldb.d_configuration_item            a134
                  on         (a11.configuration_item_key = a134.row_key)     
union 

select 'd_incident' as Table_Name, count(a15.row_key) Row_Count
from  ldb.f_incident a11                                                                  
                                                                  join        ldb.d_incident   a15
                  on         (a11.incident_key = a15.row_key)
                                                                  
                                                                  
union

select 'd_incident_category' as Table_Name, count(a146.row_key) Row_Count from  ldb.f_incident a11              
join        ldb.d_incident_category              a146
                  on        (a11.category_src_key = a146.row_key)
                                                                  
                union 
                
select 'd_incident_close_code' as Table_Name, count(a147.row_key) Row_Count from  ldb.f_incident a11         
                join        ldb.d_incident_close_code         a147
                  on ( a11.close_code_src_key = a147.row_key)

                                                                  union
                                                                
select 'd_incident_detected_by_c' as Table_Name, count(a161.row_key) Row_Count from  ldb.f_incident a11
                                                                join        ldb.d_incident   a137
                  on         (a11.incident_key = a137.row_key)
                                                                                                                                  join        ldb.d_incident_detected_by_c a161
                  on         (a137.detected_by_c_key = a161.row_key)
                                                                  
                                                                  union
                                                                  
                                                                  
                                select 'd_incident_severity' as Table_Name, count(a148.row_key) Row_Count from  ldb.f_incident a11                           join        ldb.d_incident_severity                a148
                  on         (a11.severity_src_key = a148.row_key)
                                                                  
                                                                  union
                select 'd_incident_state' as Table_Name, count(a149.row_key) Row_Count from  ldb.f_incident a11                                                                                        
                                                                  join        ldb.d_incident_state      a149
                  on         (state_src_key = a149.row_key)
                                                                  union
                                                                select 'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count from  ldb.f_incident a11              
                                                                   join        ldb.d_internal_contact  a13
                  on         (a11.opened_by_key = a13.row_key)
                                                                  union
                                                                  
                                                                select 'd_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count from  ldb.f_incident a11                                  
                                                                    join        ldb.d_internal_contact  a13
                  on         (a11.opened_by_key = a13.row_key)
                                                                  join        ldb.d_internal_contact_mdm    a144
                  on         (a13.row_current_key = a144.row_current_key)
                                                                  union
                                                                  select 'd_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count from  ldb.f_incident a11
                                                                  join        ldb.d_internal_organization_department            a143
                  on        ( a11.opened_by_department_key = a143.row_key)
                                                                   union
                                                                  select 'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count from  ldb.f_incident a11
                                                                  join        ldb.d_internal_organization_group            a143
                  on        ( a11.assignment_group_key = a143.row_key)
                                                                  union
                                                                  select 'd_internal_organization_legalentity' as Table_Name, count(a11.row_key) Row_Count from  ldb.f_incident a11
                                                                  join        ldb.d_internal_organization_legalentity                a12
                  on         (a11.company_key = a12.row_key)
                                                                  union
                                                                  select 'd_location' as Table_Name, count(a11.row_key) Row_Count from  ldb.f_incident a11
                                                                  join        ldb.d_location   a156
                  on         (a11.location_key= a156.row_key)
                                                                  union
                                                                  select 'd_task_contacttype' as Table_Name, count(a11.row_key) Row_Count from  ldb.f_incident a11
                                                                  join        ldb.d_task_contacttype                a158
                  on         (a11.reported_type_src_key = a158.row_key)
                                                                  union
                                                                  select 'd_task_impact' as Table_Name, count(a11.row_key) Row_Count from  ldb.f_incident a11
                                                                  join        ldb.d_task_impact          a155
                  on         (a11.impact_src_key = a155.row_key)
                                                                  union
                                                                  select 'd_task_priority' as Table_Name, count(a11.row_key) Row_Count from  ldb.f_incident a11
                                                                  join        ldb.d_task_priority         a157
                  on         (a11.priority_src_key = a157.row_key)
                                                                  union
                                                                   select 'd_task_urgency' as Table_Name, count(a11.row_key) Row_Count from  ldb.f_incident a11
                                                                  join        ldb.d_task_urgency         a157
                  on         (a11.urgency_src_key = a157.row_key)
                                                                  union
                                                                  select 'd_task_urgency' as Table_Name, count(a11.row_key) Row_Count from  ldb.f_incident a11
                                                                  join        ldb.dh_user_group_classification_hierarchy       a132
                  on         (a11.assignment_group_key = a132.user_group_key)
                                                                  union
                                                                    select 'dh_user_group_classification_hierarchy_level1' as Table_Name, count(a11.row_key) Row_Count from  ldb.f_incident a11
                                                                  join        ldb.dh_user_group_classification_hierarchy       a132
                  on         (a11.assignment_group_key = a132.user_group_key)
                                                                   join        ldb.dh_user_group_classification_hierarchy_level1        a133
                  on         (a132.user_group_classification_level1 = a133.user_group_level1_key)

)a
)b



