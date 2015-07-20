
select case when count(*) <> 3 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(*)  <> 3 then 'Facility and GTP not disabled in lsm_ls_dw_table_list
' 
else 'SUCCESS' end as Message
from #DWH_TABLE_SCHEMA.lsm_ls_dw_table_list
where CONCAT(target_table_name,enable_flag) in('f_employee_terminationY'
,'d_facility_requestN'
,'f_facility_requestN'
) 

