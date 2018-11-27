
SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_change_request.business_service_key' ELSE 'SUCCESS' END as Message from 
 (select count(1) cnt 
 FROM pandg_mdsdb.change_request_final SRC 
JOIN pandg_mdwdb.f_change_request TRGT 
ON SRC.sys_id = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id
LEFT JOIN pandg_mdwdb.d_service LKP 
 ON ( COALESCE(CONCAT('BUSINESS_SERVICE','~',SRC.business_service),'UNSPECIFIED') = LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.business_service IS NULL THEN 0 else -1 end)<> (TRGT.business_service_key)) a;

 
 
 