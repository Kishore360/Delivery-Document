

----
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_service_entitlement.asset_key' ELSE 'SUCCESS' END as Message
FROM watson_mdsdb.service_entitlement_final SRC 
LEFT JOIN watson_mdwdb.f_service_entitlement TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN watson_mdwdb.d_asset LKP 
	ON ( coalesce(concat('ASSET~',SRC.asset),'UNSPECIFIED') = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.asset IS NULL THEN 0 else -1 end)<> COALESCE(TRGT.asset_key ,'')

