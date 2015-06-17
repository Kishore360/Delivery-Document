



select case when count(1)> 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1)> 0 then 'MDS to DWH data validation failed between incident_final and f_incident: multiple_categorization_flag' else 'SUCCESS' end as Message
from <<tenant>>_mdsdb.incident_final S
join app_test.lsm_ls_source_timezone L 
on(S.sourceinstance  = L.sourceid )

left join <<tenant>>_mdwdb.t_task_activity TA_MC
on (TA_MC.task_row_id = S.sys_id 
and TA_MC.source_id = S.sourceinstance 
and TA_MC.task_wh_type = 'incident'
and TA_MC.task_attribute_wh_name = 'category'
and TA_MC.task_attribute_wh_old_value is not null 
and TA_MC.task_attribute_wh_new_value is not null
and TA_MC.task_attribute_wh_new_value <> TA_MC.task_attribute_wh_old_value)

join lsm_ls_etl_task_run_history RH
on (task_name = 'ITSM_CUSTOM_MEASURE'
and etl_run_id = (select max(etl_run_id) from  lsm_ls_etl_task_run_history))

where CRC32(concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
case when TA_MC.row_id is not null then 'Y' else 'N' end)
) not in (
select CRC32(concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.multiple_categorization_flag,''))
) from <<tenant>>_mdwdb.f_incident DWH);

