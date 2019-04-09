
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for sc_request_final.closure_code_src_c_key' ELSE 'SUCCESS' END as Message
FROM 
(

SELECT Count(1) AS CNT 
FROM nbcu_mdsdb.task_final SRC 
JOIN nbcu_mdwdb.f_task_c TRGT ON (SRC.sys_id =TRGT.row_id and SRC.sourceinstance=TRGT.source_id)
LEFT JOIN nbcu_mdsdb.sc_request_final SC ON (SRC.sys_id=SC.sys_id AND SRC.sourceinstance=SC.sourceinstance AND SRC.sys_class_name='SC_REQUEST')
JOIN nbcu_mdwdb.d_lov LKP ON COALESCE( CONCAT('REQUEST_STATE','~','SC_REQUEST','~','~','~',UPPER(SC.request_state)),'UNSPECIFIED')=LKP.row_id AND SC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key, CASE WHEN SC.request_state IS NULL THEN 0 ELSE -1 END)<>TRGT.closure_code_src_c_key
and TRGT.soft_deleted_flag='N'
) temp;

 


