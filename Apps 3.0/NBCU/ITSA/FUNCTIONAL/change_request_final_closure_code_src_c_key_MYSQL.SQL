SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for change_request_final_closure_code_src_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM nbcu_mdsdb.task_final SRC 
JOIN nbcu_mdwdb.f_task_c TRGT ON (SRC.sys_id =TRGT.row_id and SRC.sourceinstance=TRGT.source_id)
LEFT JOIN nbcu_mdsdb.change_request_final CR ON (SRC.sys_id=CR.sys_id AND SRC.sourceinstance=CR.sourceinstance AND SRC.sys_class_name='CHANGE_REQUEST')
JOIN nbcu_mdwdb.d_lov LKP ON COALESCE(CONCAT('COMPLETION_CODE_C~CHANGE_REQUEST~~~',UPPER(CR.u_completion_code)),'UNSPECIFIED')=LKP.row_id AND CR.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key, CASE WHEN CR.u_completion_code IS NULL THEN 0 ELSE -1 END)<>TRGT.closure_code_src_c_key
) temp;
