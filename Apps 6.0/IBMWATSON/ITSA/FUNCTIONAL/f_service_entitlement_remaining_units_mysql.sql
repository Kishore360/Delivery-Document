
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_service_entitlement.remaining_units' ELSE 'SUCCESS' END as Message
FROM ibmwatson_mdsdb.service_entitlement_final SRC 
LEFT JOIN ibmwatson_mdwdb.f_service_entitlement TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.remaining_units,'')<> COALESCE(TRGT.remaining_units,'')
