

SELECT 
CASE WHEN CNT  > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT  > 0 THEN 'MDS to DWH data validation failed for f_task.business_service_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT 
COUNT(1) AS CNT 
FROM (select sys_id,sourceinstance from molinahealth_mdsdb.task_final  where sys_class_name in ('INCIDENT','PROBLEM','CHANGE_REQUEST')) SRC
 left  join molinahealth_mdsdb.incident_final INC
on SRC.sys_id=INC.sys_id and SRC.sourceinstance=INC.sourceinstance
 left join molinahealth_mdsdb.problem_final PR
on SRC.sys_id=PR.sys_id and SRC.sourceinstance=PR.sourceinstance
  join molinahealth_mdsdb.change_request_final CR
on SRC.sys_id=CR.sys_id and SRC.sourceinstance=CR.sourceinstance
 JOIN molinahealth_mdwdb.f_task TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
left JOIN molinahealth_mdwdb.d_service LKP ON (CONCAT('BUSINESS_SERVICE~',COALESCE(INC.cmdb_ci,PR.cmdb_ci,CR.cmdb_ci))=LKP.row_id AND SRC.sourceinstance=LKP.source_id)
WHERE LKP.dw_updated_on<TRGT.dw_updated_on and 
COALESCE(LKP.row_key,CASE WHEN  COALESCE(INC.cmdb_ci,PR.cmdb_ci,CR.cmdb_ci) is null THEN 0 ELSE -1 END)<> TRGT.business_service_key
) temp; 
