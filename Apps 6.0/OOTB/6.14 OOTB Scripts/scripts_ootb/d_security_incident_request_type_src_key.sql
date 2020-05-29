
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_security_incident.request_type_src_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sn_si_incident_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_security_incident TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
	ON ( CONCAT('REQUEST_TYPE','~','SECURITY_INC','~',UPPER(REQUEST_TYPE),'UNSPECIFIED') = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id AND dimension_class ='SECURITY_INC_REQUESTTYPE')
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.request_type IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.request_type_src_key ,'')
