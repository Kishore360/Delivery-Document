SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM bmc_mdsdb.hlx_hpd_help_desk_final WHERE CDCTYPE<>'D') SRC
 LEFT JOIN bmch_mdwdb.f_incident TRGT 
 ON (SRC.incident_number=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN bmch_mdwdb.d_calendar_time LKP 
on (LKP.row_id  = date_format(convert_tz(SRC.Submit_Date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%H%i')
  and LKP.source_id= 0 )
WHERE LKP.row_key  <> TRGT.opened_time_key