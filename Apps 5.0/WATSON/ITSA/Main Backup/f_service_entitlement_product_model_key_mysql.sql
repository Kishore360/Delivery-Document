


----

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_service_entitlement.product_model_key' ELSE 'SUCCESS' END as Message
FROM watson_mdsdb.service_entitlement_final SRC 
LEFT JOIN watson_mdwdb.f_service_entitlement TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN watson_mdwdb.d_product_model LKP 
	ON ( Coalesce(SRC.product,'UNSPECIFIED') = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.product IS NULL THEN 0 else -1 end)<> COALESCE(TRGT.product_model_key ,'')

