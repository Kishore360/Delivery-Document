/* 
SELECT 
CASE WHEN CNT  > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT  > 0 THEN 'MDS to DWH data validation failed for f_task.business_service_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT COUNT(1) AS CNT 
FROM molinahealth_mdsdb.task_final SRC
LEFT JOIN molinahealth_mdwdb.d_task TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
LEFT JOIN molinahealth_mdwdb.f_incident INC ON (SRC.sys_id=INC.row_id AND SRC.sourceinstance=INC.source_id)
LEFT JOIN molinahealth_mdwdb.f_problem PR ON (SRC.sys_id=PR.row_id AND SRC.sourceinstance=PR.source_id)
-- LEFT JOIN molinahealth_mdwdb.f_request_item RT ON (SRC.sys_id=RT.row_id AND SRC.sourceinstance=RT.source_id)
LEFT JOIN molinahealth_mdwdb.f_change_request CR ON (SRC.sys_id=CR.row_id AND SRC.sourceinstance=CR.source_id)
-- LEFT JOIN molinahealth_mdwdb.f_hr_case_c HR ON (SRC.sys_id = HR.row_id AND SRC.sourceinstance=HR.source_id)
-- LEFT JOIN molinahealth_mdwdb.f_hr_task_c HT ON (SRC.sys_id=HT.row_id AND SRC.sourceinstance=HT.source_id)
-- LEFT JOIN molinahealth_mdwdb.f_request REQ ON (SRC.sys_id=REQ.row_id AND SRC.sourceinstance=REQ.source_id)
-- LEFT JOIN molinahealth_mdwdb.f_request_task REQTK ON (SRC.sys_id = REQTK.row_id AND SRC.sourceinstance=REQTK.source_id)
-- LEFT JOIN molinahealth_mdwdb.f_problem_task PRTK ON (SRC.sys_id = PRTK.row_id AND SRC.sourceinstance=PRTK.source_id)
JOIN molinahealth_mdwdb.f_task TG ON (TRGT.row_key=TG.task_key AND TRGT.source_id=TG.source_id)
JOIN molinahealth_mdwdb.d_service LKP ON (CONCAT('BUSINESS_SERVICE~',SRC.business_service)=LKP.row_id AND SRC.sourceinstance=LKP.source_id)
WHERE 
COALESCE(INC.business_service_key,PR.business_service_key,
-- RT.business_service_key,
CR.business_service_key,
0,
-- HR.business_service_key,
-- HT.business_service_key,
-- REQ.business_service_key,
-- REQTK.business_service_key,
-- PRTK.business_service_key,
LKP.row_key,CASE WHEN SRC.business_service IS NULL THEN 0 ELSE -1 END)<> TG.business_service_key
) a; 
 */

SELECT 
CASE WHEN CNT  > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT  > 0 THEN 'MDS to DWH data validation failed for f_task.business_service_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT 
COUNT(1) AS CNT 
FROM molinahealth_mdsdb.task_final SRC
left join molinahealth_mdsdb.incident_final INC
on SRC.sys_id=INC.sys_id and SRC.sourceinstance=INC.sourceinstance
left join molinahealth_mdsdb.problem_final PR
on SRC.sys_id=PR.sys_id and SRC.sourceinstance=PR.sourceinstance
left join molinahealth_mdsdb.change_request_final CR
on SRC.sys_id=CR.sys_id and SRC.sourceinstance=CR.sourceinstance
LEFT JOIN molinahealth_mdwdb.f_task TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN molinahealth_mdwdb.d_service LKP ON (CONCAT('BUSINESS_SERVICE~',COALESCE(INC.cmdb_ci,PR.cmdb_ci,CR.cmdb_ci))=LKP.row_id AND SRC.sourceinstance=LKP.source_id)
WHERE
COALESCE(LKP.row_key,CASE WHEN  COALESCE(INC.cmdb_ci,PR.cmdb_ci,CR.cmdb_ci) is null THEN 0 ELSE -1 END)<> TRGT.business_service_key
) temp; 
