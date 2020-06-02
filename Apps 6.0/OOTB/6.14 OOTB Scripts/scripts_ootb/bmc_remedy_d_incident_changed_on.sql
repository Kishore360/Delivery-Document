 SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.changed_on' 
ELSE 'SUCCESS' END as Message from #MDS_TABLE_SCHEMA.hlx_hpd_help_desk_final SRC
join #DWH_TABLE_SCHEMA.d_incident TRGT 
on (SRC.incident_number = TRGT.row_id  and SRC.sourceinstance = TRGT.source_id ) 
where 
coalesce(convert_tz(SRC.last_modified_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'UNSPECIFIED')<>TRGT.changed_on;