 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.parent_age_at_closure' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdwdb.f_change_task TRGT 
JOIN <<tenant>>_mdwdb.d_change_task d ON d.row_key = TRGT.change_task_key and d.source_id = TRGT.source_id
JOIN <<tenant>>_mdwdb.d_change_request par ON par.row_key = TRGT.change_request_key
where TRGT.Parent_Age_At_Task_closure  <> CASE WHEN d.closed_on > par.opened_on 
THEN TIMESTAMPDIFF(SECOND, CONVERT_TZ(par.opened_on,'<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'),
CONVERT_TZ(d.closed_on,'<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')) else 0 END
and ( TRGT.Parent_Age_At_Task_Closure IS NULL OR TRGT.Parent_Age_At_Task_Closure <> 
CASE WHEN d.closed_on > par.opened_on THEN TIMESTAMPDIFF(SECOND, CONVERT_TZ(par.opened_on,'<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'),
CONVERT_TZ(d.closed_on,'<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')) else 0 END);
