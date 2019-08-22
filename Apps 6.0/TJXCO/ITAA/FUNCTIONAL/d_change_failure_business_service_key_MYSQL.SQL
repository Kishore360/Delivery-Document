SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.business_service_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM tjxco_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC 
left outer join (SELECT * FROM tjxco_mdwdb.d_change_failure where year(effective_to)=2999 
) TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN tjxco_mdwdb.d_service LKP 
	ON  CONCAT('BUSINESS_SERVICE~', COALESCE(SRC.business_service,SRC.cmdb_ci)) = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN  COALESCE(SRC.business_service,SRC.cmdb_ci) IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.business_service_key ,'')



