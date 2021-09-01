SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_failure.count_health_plan_entity_affected_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM "MOLINA_P_DB"."MDSDB"."CHANGE_REQUEST_FINAL" SRC 
LEFT JOIN mdw.d_change_failure TRGT ON SRC.sys_id =TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE 
CASE 
WHEN SRC.u_health_plan_entity_affected IS NULL THEN -1
WHEN UPPER(SRC.u_health_plan_entity_affected)='ALL' THEN 999
WHEN UPPER(SRC.u_health_plan_entity_affected)='NONE' THEN 0
ELSE (length(SRC.u_health_plan_entity_affected)-length(replace(SRC.u_health_plan_entity_affected,',',''))+1)
END <> TRGT.count_health_plan_entity_affected_c
AND SRC.cdctype='X'
) temp; 
