



select case when count(1)> 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1)> 0 then 'MDS to DWH data validation failed between problem_final and f_problem: priority_escalated_flag' else 'SUCCESS' end as Message
from <<tenant>>_mdsdb.problem_final S
join app_test.lsm_ls_source_timezone L 
on(S.sourceinstance  = L.sourceid )

left join <<tenant>>_mdwdb.t_task_activity TA_PR
on (TA_PR.task_row_id = S.sys_id 
and TA_PR.source_id = S.sourceinstance 
and TA_PR.task_wh_type = 'problem'
and TA_PR.task_attribute_wh_name = 'priority'
and TA_PR.task_attribute_wh_old_value is not null
and TA_PR.task_attribute_wh_new_value is not null
and TA_PR.task_attribute_wh_new_value < TA_PR.task_attribute_wh_old_value)

join lsm_ls_etl_task_run_history RH
on (task_name = 'ITSM_CUSTOM_MEASURE'
and etl_run_id = (select max(etl_run_id) from  lsm_ls_etl_task_run_history))

where CRC32(concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
case when TA_PR.row_id is not null then 'Y' else 'N' end)
) not in (
select CRC32(concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.priority_escalated_flag,''))
) from <<tenant>>_mdwdb.f_problem DWH);

