SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_sec_incident.caused_by_problem_flag' ELSE 'SUCCESS' END as Message
  FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sn_si_incident_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_security_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 left join #DWH_TABLE_SCHEMA.f_security_incident TRGTF
 on (SRC.sys_id=TRGTF.row_id 
 AND SRC.sourceinstance=TRGTF.source_id) 
 WHERE COALESCE( CASE WHEN SRC.parent is not null and TRGTF.caused_by_problem_key not in (0,-1) then 'Y' else 'N' END ,'') <>COALESCE(TRGT.caused_by_problem_flag ,'')
 
