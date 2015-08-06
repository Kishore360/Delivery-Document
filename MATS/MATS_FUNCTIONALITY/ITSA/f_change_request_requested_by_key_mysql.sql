

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.requested_by_key' ELSE 'SUCCESS' END as Message from (select COALESCE(LKP.row_key,CASE WHEN SRC.requested_by IS NULL THEN 0 else '-1' end)abc, COALESCE(TRGT.requested_by_key,'')def
 FROM <<tenant>>_mdsdb.change_request_final SRC
 LEFT JOIN <<tenant>>_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN <<tenant>>_mdwdb.d_internal_contact LKP 
 ON ( CONCAT('INTERNAL_CONTACT~',requested_by)= LKP.row_id 
 
AND SRC.sourceinstance= LKP.source_id ))a
 WHERE abc<>def
