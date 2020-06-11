SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_activity.update_reason' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.bmc_hpd_help_desk_sys_audit_final WHERE CDCTYPE<>'D') SRC 
  -- right join done assuming rowcount is validated
 RIGHT JOIN #DWH_TABLE_SCHEMA.f_incident_activity TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE coalesce(TRGT.primary_sequence_id,'') <>0
 AND COALESCE( 'UNSPECIFIED' ,'')<> COALESCE(TRGT.update_reason,'')
 -- AND COALESCE( SRC.reason ,'')<> COALESCE(TRGT.update_reason,'')
