 SELECT CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_change_request.business_service_key' ELSE 'SUCCESS' END as Message  
 FROM (select count(1)cnt from aon_mdsdb.change_request_final SRC
 LEFT JOIN aon_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN aon_mdwdb.d_service LKP 
 ON ( COALESCE(CONCAT('BUSINESS_SERVICE','~',SRC.u_business_service),'UNSPECIFIED') = LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_business_service  IS NULL THEN 0 else -1 end) <> (TRGT.business_service_key))b;
 
 
 
 
 
 
