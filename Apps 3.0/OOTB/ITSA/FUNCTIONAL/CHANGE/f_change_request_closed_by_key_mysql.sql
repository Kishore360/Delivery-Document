 SELECT 
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_change_request.closed_by_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM <<tenant>>_mdsdb.change_request_final SRC
 LEFT JOIN <<tenant>>_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
    LEFT JOIN <<tenant>>_mdwdb.d_lov_map dlm 
ON TRGT.state_src_key = dlm.src_key AND dlm.dimension_wh_code = 'CLOSED'
 LEFT JOIN <<tenant>>_mdwdb.d_internal_contact LKP 
 ON ( CONCAT('INTERNAL_CONTACT~',closed_by)= LKP.row_id 
 AND SRC.sourceinstance= LKP.source_id
AND TRGT.pivot_date
 BETWEEN LKP.effective_from AND LKP.effective_to)
 WHERE 
 COALESCE(LKP.row_key,CASE WHEN SRC.closed_by IS NULL THEN 0 else -1 end)<> (TRGT.closed_by_key)) temp;