SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.close_code_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select count(1) as cnt
FROM pandg_mdsdb.change_request_final SRC
LEFT JOIN pandg_mdwdb.d_change_request TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN pandg_mdwdb.d_lov LKP ON CONCAT('CLOSE_CODE','~','CHANGE_REQUEST','~',SRC.close_code)=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.close_code IS NULL THEN 0 ELSE -1 END)<>TRGT.close_code_src_key
AND TRGT.soft_deleted_flag='N'
) temp; 


 
 
 