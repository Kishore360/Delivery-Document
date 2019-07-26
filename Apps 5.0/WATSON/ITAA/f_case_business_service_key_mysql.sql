
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.business_service_key' ELSE 'SUCCESS' END as Message
FROM watson_mdsdb.sn_customerservice_case_final SRC 
LEFT JOIN watson_mdwdb.f_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN watson_mdwdb.d_service LKP 
	ON ( COALESCE(CONCAT('BUSINESS_SERVICE','~',SRC.business_service),'UNSPECIFIED') = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.business_service IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.business_service_key ,'')
