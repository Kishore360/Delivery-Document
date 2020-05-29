SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.opened_on' ELSE 'SUCCESS' END as Message from schneider_mdsdb.hpd_help_desk_final  SRC JOIN schneider_mdwdb.d_incident TRGT ON (SRC.incident_number = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.sourceinstance = TRGT.source_id ) WHERE convert_tz(SRC.reported_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')<> (TRGT.opened_on) 
