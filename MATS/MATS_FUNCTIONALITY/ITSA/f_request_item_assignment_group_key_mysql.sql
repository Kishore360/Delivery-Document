

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.assignment_group_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.sc_req_item_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN <<tenant>>_mdwdb.d_internal_organization LKP 
 ON ( COALESCE(CONCAT('GROUP~', SRC.assignment_group),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assignment_group IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.assignment_group_key,'')
;
