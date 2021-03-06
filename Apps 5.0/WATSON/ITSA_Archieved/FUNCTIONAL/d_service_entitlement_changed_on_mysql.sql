
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service_entitlement.changed_on' ELSE 'SUCCESS' END as Message
  FROM watson_mdsdb.service_entitlement_final SRC 
LEFT JOIN watson_mdwdb.d_service_entitlement TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE TRGT.row_key not in (0, -1) and 
convert_tz(SRC.sys_updated_on, 'GMT', 'America/New_York')<> TRGT.changed_on 