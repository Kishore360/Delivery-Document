
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service_entitlement.active_flag' ELSE 'SUCCESS' END as Message
FROM watson_mdsdb.service_entitlement_final SRC 
LEFT JOIN watson_mdwdb.d_service_entitlement TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE TRGT.row_key not in (0, -1) and 
COALESCE(CASE WHEN SRC.active=1 then 'Y' else 'N' END ,'')<> COALESCE(TRGT.active_flag ,'')
