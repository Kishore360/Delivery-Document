
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service_entitlement.per_unit_flag' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.service_entitlement_final SRC 
LEFT JOIN <<tenant>>_mdwdb.d_service_entitlement TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(CASE WHEN SRC.per_unit = 1 then 'Y' else 'N' END ,'')<> COALESCE(TRGT.per_unit_flag ,'')