SELECT 
CASE WHEN CNT  > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT  > 0 THEN 'MDS to DWH data validation failed for f_task.application_key' ELSE 'SUCCESS' END as Message
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
JOIN molinahealth_mdwdb.d_application LKP ON (CONCAT('APPLICATION~',SRC.cmdb_ci)=LKP.row_id AND SRC.sourceinstance=LKP.source_id)
WHERE 
COALESCE(INC.application_key,PR.application_key,
-- RT.application_key,
CR.application_key,
0,
-- HR.application_key,
-- HT.application_key,
-- REQ.application_key,
-- REQTK.application_key,
-- PRTK.application_key,
LKP.row_key,CASE WHEN SRC.cmdb_ci IS NULL THEN 0 ELSE -1 END)<> TG.application_key
) a; 

-- other way of writing Query
/* SELECT COUNT(1) AS CNT 
FROM molinahealth_mdsdb.task_final SRC
left join molinahealth_mdsdb.incident_final INC
on SRC.sys_id=INC.sys_id and SRC.sourceinstance=INC.sourceinstance
left join molinahealth_mdsdb.problem_final PR
on SRC.sys_id=PR.sys_id and SRC.sourceinstance=PR.sourceinstance
left join molinahealth_mdsdb.change_request_final CR
on SRC.sys_id=CR.sys_id and SRC.sourceinstance=CR.sourceinstance
LEFT JOIN molinahealth_mdwdb.f_task TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN molinahealth_mdwdb.d_application LKP ON (CONCAT('APPLICATION~',COALESCE(INC.cmdb_ci,PR.cmdb_ci,CR.cmdb_ci))=LKP.row_id AND SRC.sourceinstance=LKP.source_id)
WHERE
COALESCE(LKP.row_key,CASE WHEN 
                                                                                COALESCE(INC.cmdb_ci,PR.cmdb_ci,CR.cmdb_ci) is null
                                                                                                THEN 0 ELSE -1 END)<> TRGT.application_key */
