
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_security_incident.sla_suspended_src_code' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.sn_si_incident_final SRC 
LEFT JOIN <<tenant>>_mdwdb.d_security_incident TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.sla_suspended_reason,'')<> COALESCE(TRGT.sla_suspended_src_code,'')
