SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_security_incident.attack_vector_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sn_si_incident_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_security_incident TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
left join #DWH_TABLE_SCHEMA.d_attack_vector LKP
    ON (SRC.attack_vector =LKP.row_id 
	AND SRC.sourceinstance =LKP.source_id )
WHERE 
COALESCE(LKP.row_key, case when SRC.attack_vector is null then 0 else -1 end ) <> COALESCE(TRGT.attack_vector_key,'') 