 SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select 'f_problem' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem    a11

union

select  'd_task_urgency' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem     a11     join        ldb.d_task_urgency    a12
   on         (a11.urgency_src_key = a12.row_key)

union

select  'd_task_priority' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem     a11 	join        ldb.d_task_priority   a13
	on         (a11.priority_src_key = a13.row_key)

union

select  'd_task_contacttype' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem    a11 	join        ldb.d_task_contacttype a14
	on         (a11.reported_type_src_key= a14.row_key)
        
union

select  'd_problem_state' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem     a11 	join    ldb.d_problem_state   a15
                  on         (a11.state_src_key  = a15.row_key)

union

select  'd_problem' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem    a11         join        ldb.d_problem  a16
        on         (a11.problem_key = a16.row_key)

union

select  'd_internal_organization_group' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem    a11         join        ldb.d_internal_organization_group a16
        on         (a11.assignment_group_key = a16.row_key)

union

select  'd_internal_contact_mdm' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem    a11    join	ldb.d_internal_contact	a12
	  on 	(a11.opened_by_key = a12.row_key)
join        ldb.d_internal_contact_mdm a17
        on         (a12.row_current_key = a17.row_key)

union

select  'd_internal_contact' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem    a11         join        ldb.d_internal_contact a18
        on         (a11.opened_by_key  = a18.row_key)

union

select  'd_configuration_item' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem    a11         join        ldb.d_configuration_item a19
        on         (a11.configuration_item_key  = a19.row_key)

union

select  'd_calendar_time' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem    a11         join        ldb.d_calendar_time a20
        on         (a11.opened_time_key  = a20.row_key)

union

select  'd_calendar_month' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem    a11         join	ldb.d_calendar_date	a21
	  on 	(a11.opened_on_key = a21.row_key)
	join	ldb.d_calendar_month	a22
	  on 	(a21.month_start_date_key = a22.row_key)

union

select  'd_calendar_date' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem    a11         join        ldb.d_calendar_date a23
        on         (a11.opened_on_key  = a23.row_key)




union

select  'd_problem_source_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem    a11         join        ldb.d_problem_source_c a24
        on         (a11.source_src_c_key  = a24.row_key)

union

select  'd_problem_root_cause_category_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem    a11         join        ldb.d_problem_root_cause_category_c a25
        on         (a11.root_cause_category_src_c_key  = a25.row_key)

union

select  'd_problem_platform_impacted_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem    a11         join        ldb.d_problem_platform_impacted_c a26
        on         (a11.platform_impacted_src_c_key  = a26.row_key)

union

select  'd_problem_phase_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem    a11         join        ldb.d_problem_phase_c a27
        on         (a11.phase_src_c_key  = a27.row_key)

union

select  'd_problem_highest_level_of_cust_imp_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem    a11         join        ldb.d_problem_highest_level_of_cust_imp_c a28
        on         (a11.highest_level_of_cust_impacted_src_c_key = a28.row_key)


union

select  'd_problem_closure_code_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem    a11         join        ldb.d_problem_closure_code_c a29
        on         (a11.closure_code_src_c_key  = a29.row_key)

union

select  'd_internal_contact_submitted_by_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem    a11         join        ldb.d_internal_contact_submitted_by_c a29
        on         (a11.submitted_by_c_key  = a29.row_key)
 
 

union

select  'd_internal_contact_prob_mgmt_pt_of_contact_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem    a11         join        ldb.d_internal_contact_prob_mgmt_pt_of_contact_c a29
        on         (a11.submitted_by_c_key  = a29.row_key)
)a
)b
