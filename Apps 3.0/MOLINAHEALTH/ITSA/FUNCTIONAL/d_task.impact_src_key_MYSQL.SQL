SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_task.impact_src_key' ELSE 'SUCCESS' END as Message
FROM 
( 
SELECT COUNT(1) AS CNT 
FROM molinahealth_mdsdb.task_final SRC
LEFT JOIN molinahealth_mdwdb.d_task TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
LEFT JOIN molinahealth_mdwdb.f_incident INC ON (SRC.sys_id=INC.row_id AND SRC.sourceinstance=INC.source_id)
LEFT JOIN molinahealth_mdwdb.f_problem PR ON (SRC.sys_id=PR.row_id AND SRC.sourceinstance=PR.source_id)
LEFT JOIN molinahealth_mdwdb.f_request_item RT ON (SRC.sys_id=RT.row_id AND SRC.sourceinstance=RT.source_id)
LEFT JOIN molinahealth_mdwdb.f_change_request CR ON (SRC.sys_id=CR.row_id AND SRC.sourceinstance=CR.source_id)
LEFT JOIN molinahealth_mdwdb.f_hr_case_c HR ON (SRC.sys_id = HR.row_id AND SRC.sourceinstance=HR.source_id)
LEFT JOIN molinahealth_mdwdb.f_hr_task_c HT ON (SRC.sys_id=HT.row_id AND SRC.sourceinstance=HT.source_id)
LEFT JOIN molinahealth_mdwdb.f_request REQ ON (SRC.sys_id=REQ.row_id AND SRC.sourceinstance=REQ.source_id)
LEFT JOIN molinahealth_mdwdb.f_request_task REQTK ON (SRC.sys_id = REQTK.row_id AND SRC.sourceinstance=REQTK.source_id)
LEFT JOIN molinahealth_mdwdb.f_problem_task PRTK ON (SRC.sys_id = PRTK.row_id AND SRC.sourceinstance=PRTK.source_id)
LEFT JOIN molinahealth_mdwdb.d_lov LM ON (concat('IMPACT~TASK~~~',SRC.IMPACT)=LM.row_id AND SRC.sourceinstance=LM.source_id)
WHERE 
COALESCE(INC.impact_src_key,PR.impact_src_key,RT.impact_src_key,CR.impact_src_key,HR.impact_src_key,HT.impact_src_key,REQ.impact_src_key,REQTK.impact_src_key,
PRTK.impact_src_key,
LM.row_key,CASE WHEN SRC.impact IS NULL THEN 0 ELSE -1 END)<>TRGT.impact_src_key
) a; 







