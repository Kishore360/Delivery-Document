

select case when count(1) <> 3 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1)  <> 3 then 'Facility and GTP not disabled in lsm_ls_dw_table_list
' 
else 'SUCCESS' end as Message
from <<tenant>>_mdwdb.lsm_ls_dw_table_list
where CONCAT(target_table_name,enable_flag) in('f_employee_terminationY'
,'d_facility_requestN'
,'f_facility_requestN'
) 

