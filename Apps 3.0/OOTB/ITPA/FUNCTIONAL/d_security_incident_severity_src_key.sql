SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_security_incident.severity_src_key' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.sn_si_incident_final SRC 
LEFT JOIN <<tenant>>_mdwdb.d_security_incident TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN <<tenant>>_mdwdb.d_lov LKP 
	ON COALESCE( CONCAT('SEVERITY','~','SECURITY_INC','~','~','~',UPPER(SEVERITY)),'UNSPECIFIED') = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id AND dimension_class ='SEVERITY~SECURITY_INC'
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.severity IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.severity_src_key ,'')
