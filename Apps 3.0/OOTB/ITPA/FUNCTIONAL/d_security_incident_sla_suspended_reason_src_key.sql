
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_security_incident.sla_suspended_reason_src_key' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.sn_si_incident_final SRC 
LEFT JOIN <<tenant>>_mdwdb.d_security_incident TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN <<tenant>>_mdwdb.d_lov LKP 
	ON ( CONCAT('SLA_SUSPENDED','~','SM','~','~','~',UPPER(SLA_SUSPENDED_REASON),'UNSPECIFIED') = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id AND dimension_class ='SECURITY_INC_SLA_SUSP_REASON')
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sla_suspended_reason IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.sla_suspended_reason_src_key ,'')
