SELECT 
-- src.sys_id,trgt.row_id as trgt_row_id,COALESCE(src.u_health_plan_entity_affected,'UNSPECIFIED') as src_health_plan_entity_affected, trgt.health_plan_entity_affected_c as trgt_health_plan_entity_affected
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.health_plan_entity_affected_c' ELSE 'SUCCESS' END as Message
FROM molinahealth_mdsdb.change_request_final src 
LEFT JOIN molinahealth_mdwdb.d_change_request trgt ON src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id
WHERE COALESCE(src.u_health_plan_entity_affected,'UNSPECIFIED') <> COALESCE(trgt.health_plan_entity_affected_c,'UNSPECIFIED');
