
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_security_incident.substate_src_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sn_si_incident_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_security_incident TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
	ON ( CONCAT('SUBSTATE','~','SECURITY_INC','~',UPPER(STATE),'~','~',UPPER(SUBSTATE)) = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id AND dimension_class ='SUBSTATE~SECURITY_INC')
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.substate IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.substate_src_key ,'')
