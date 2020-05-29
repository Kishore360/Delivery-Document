 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.first_call_resolution_flag' ELSE 'SUCCESS' END as Message
 
  FROM  ( SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
  LEFT JOIN  #DWH_TABLE_SCHEMA.f_incident TRGTF 
 ON (TRGTF.incident_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)
 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM ON TRGTF.state_src_key=LM.src_key and LM.dimension_class='STATE~INCIDENT'
LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) FRESH 
ON (TRGT.source_id = FRESH.source_id)

 WHERE 
 CASE WHEN
 LM.dimension_wh_code IN('RESOLVED','CLOSED') 
 AND TIMESTAMPDIFF(MINUTE,coalesce(SRC.opened_at,'1970-01-01 00:00:00'), coalesce(SRC.resolved_at,SRC.closed_at,SRC.sys_updated_on))<30
  THEN 'Y'
  WHEN  TIMESTAMPDIFF(MINUTE,SRC.opened_at,convert_tz(FRESH.lastupdated,'<<DW_TARGET_TIME_ZONE>>' , '<<TENANT_SSI_TIME_ZONE>>'))<30
AND  LM.dimension_wh_code IN('OPEN') THEN 'P'
ELSE 'N' END  <> COALESCE(TRGT.first_call_resolution_flag ,'')
