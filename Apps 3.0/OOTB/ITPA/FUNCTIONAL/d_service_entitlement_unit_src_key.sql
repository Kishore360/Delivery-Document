
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service_entitlement.unit_src_key' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.service_entitlement_final SRC 
LEFT JOIN <<tenant>>_mdwdb.d_service_entitlement TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN <<tenant>>_mdwdb.d_lov LKP 
	ON ( coalesce(concat('UNIT~SERVICE_ENTITLEMENT~~~',SRC.unit),'UNSPECIFIED') = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id AND dimension_class = 'UNIT~SERVICE_ENTITLEMENT')
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.unit IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.unit_src_key ,'')
