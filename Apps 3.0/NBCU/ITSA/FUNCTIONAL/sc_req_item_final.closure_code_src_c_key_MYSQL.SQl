
-- Request Item : sc_req_item_final
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for sc_req_item_final.closure_code_src_c_key' ELSE 'SUCCESS' END as Message
FROM 
(

SELECT Count(1) AS CNT 
FROM nbcu_mdsdb.task_final SRC 
JOIN nbcu_mdwdb.f_task_c TRGT ON (SRC.sys_id =TRGT.row_id and SRC.sourceinstance=TRGT.source_id)
LEFT JOIN nbcu_mdsdb.sc_req_item_final SCI ON (SRC.sys_id=SCI.sys_id AND SRC.sourceinstance=SCI.sourceinstance AND SRC.sys_class_name='SC_REQ_ITEM')
JOIN nbcu_mdwdb.d_lov LKP ON COALESCE(CONCAT('CLOSE_CODE_C~SC_REQ_ITEM~~~',UPPER(SCI.u_close_code)),'UNSPECIFIED')=LKP.row_id AND SCI.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key, CASE WHEN UPPER(SCI.u_close_code) IS NULL THEN 0 ELSE -1 END)<>TRGT.closure_code_src_c_key
) temp;

 



