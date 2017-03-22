 SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'mDS to DWH data validation failed for f_incident.urgency_src_key' ELSE 'SUCCESS' END as message from (select count(1) cnt 
 FROm <<tenant>>_mdsdb.change_request_final SRC 
  JOIN <<tenant>>_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN <<tenant>>_mdwdb.d_lov LKP 
 ON ( concat('URGENCY','~','CHANGE_REQUEST','~','~','~',upper(urgency))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE TRGT.soft_deleted_flag='N' and COALESCE(LKP.row_key,CASE WHEN SRC.urgency IS NULL THEN 0 else -1 end)<> COALESCE(TRGT.urgency_src_key) )b 
 
 