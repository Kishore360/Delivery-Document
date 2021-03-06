SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.close_code_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.change_request_final SRC 
LEFT JOIN png_mdwdb.d_change_request TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
LEFT JOIN png_mdwdb.d_lov LKP 
ON (concat('CLOSE_CODE~CHANGE_REQUEST~~~',UPPER(SRC.close_code))= LKP.row_id AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.close_code IS NULL THEN 0 else -1 end)<> (TRGT.close_code_src_key)
 and TRGT.soft_deleted_flag='N'
) temp; 


 
 
 