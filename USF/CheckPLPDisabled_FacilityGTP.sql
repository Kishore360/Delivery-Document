

select case when count(1)  <> 10 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1)  <> 10 then 'Facility and GTP not disabled in lsm_ls_custom_measures_list' 
else 'SUCCESS' end as Message from usf_mdwdb.lsm_ls_custom_measures_list
where CONCAT(target_table_name,custom_column,enable_flag) in('fs_facility_requestfirst_call_resolution_flagN'
,'fs_facility_requestmultiple_assignment_flagN'
,'fs_facility_requestpriority_escalated_flagN'
,'fs_facility_requestbacklog_flagN'
,'f_facility_requestage_keyN'
,'d_facility_requestdomain_keyN'
,'d_requestemployee_numberN'
,'d_requestemployee_numberN'
,'d_requestemployee_numberN'
,'d_requestemployee_numberN') 

