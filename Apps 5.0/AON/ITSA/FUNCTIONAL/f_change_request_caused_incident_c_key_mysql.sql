 SELECT CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_change_request.business_service_key' ELSE 'SUCCESS'
 END as Message  
 FROM (select count(1) as cnt from aon_mdsdb.change_request_final SRC
 LEFT JOIN aon_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN aon_mdwdb.d_lov LKP 
 ON ( COALESCE(CONCAT('CAUSED_INCIDENT_C~CHANGE_REQUEST~~~',SRC.u_caused_incident),'UNSPECIFIED') = LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_caused_incident  IS NULL THEN 0 else -1 end) 
<> (TRGT.caused_incident_c_key))b;
 