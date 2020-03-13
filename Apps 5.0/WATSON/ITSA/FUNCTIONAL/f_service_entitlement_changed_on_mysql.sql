
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_service_entitlement.changed_on' ELSE 'SUCCESS' END as Message
  FROM watson_mdsdb.service_entitlement_final SRC 
LEFT JOIN watson_mdwdb.f_service_entitlement TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE convert_tz(SRC.sys_updated_on,'UTC','GMT')<> TRGT.changed_on and SRC.CDCTYPE<>'D';
