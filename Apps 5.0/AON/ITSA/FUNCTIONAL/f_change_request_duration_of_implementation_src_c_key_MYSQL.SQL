 SELECT CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_change_request.duration_of_implementation_src_c_key
' ELSE 'SUCCESS' END as Message  
 FROM (select count(1)cnt from aon_mdsdb.change_request_final SRC
 LEFT JOIN aon_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN aon_mdwdb.d_lov LKP 
 ON (coalesce(CONCAT('DURATION_IMPLEMENTATION_C~CHANGE_REQUEST~~~',SRC.u_duration_of_implementation),'UNSPECIFIED')=LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_duration_of_implementation IS NULL THEN 0 else -1 end) 
<> (TRGT.duration_of_implementation_src_c_key
))b;
