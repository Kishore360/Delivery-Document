/*If the records fail ,please check if it falls on DST Change date .If this is the case then refer ITSM-2762 or App-1665(parent JIRA)*/


SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.open_to_close_duration' ELSE 'SUCCESS' END as Message 
 from (select count(1) cnt 
 FROM #MDS_TABLE_SCHEMA.incident_final SRC
  JOIN #DWH_TABLE_SCHEMA.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 left JOIN #DWH_TABLE_SCHEMA.d_lov_map MAP ON MAP.SRC_KEY=TRGT.STATE_SRC_KEY
WHERE  (TRGT.open_to_close_duration)<>TIMESTAMPDIFF(second,convert_tz(convert_tz( SRC.opened_at,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),
'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'), 
convert_tz(convert_tz(SRC.closed_at,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'<<DW_TARGET_TIME_ZONE>>',
'<<TENANT_SSI_TIME_ZONE>>'))
AND dimension_wh_code = 'CLOSED')b




