
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.review_status_src_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.change_request_final SRC
 LEFT JOIN <<tenant>>_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN <<tenant>>_mdwdb.d_lov LKP 
 ON ( CONCAT('REVIEW_STATUS','~','CHANGE_REQUEST','~','~','~',UPPER(review_status)) = LKP.src_rowid 
 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.review_status IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.review_status_src_key,'')
