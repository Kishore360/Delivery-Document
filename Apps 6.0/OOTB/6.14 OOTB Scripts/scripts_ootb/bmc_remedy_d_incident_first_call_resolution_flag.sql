 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.first_call_resolution_flag' ELSE 'SUCCESS' END as Message

  FROM  ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_hpd_help_desk_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_incident TRGT 
 ON (SRC.incident_number=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 
left join #DWH_TABLE_SCHEMA.d_lov_map L 
 ON (SRC.status=L.dimension_code
 AND SRC.sourceinstance=L.source_id AND L.dimension_class = 'STATE~INCIDENT' )
 
LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) FRESH 
ON (TRGT.source_id = FRESH.source_id)

 WHERE 
 CASE WHEN
 L.dimension_wh_code IN('RESOLVED','CLOSED') 
 AND TIMESTAMPDIFF(MINUTE,coalesce(SRC.Submit_Date,'1970-01-01 00:00:00'), coalesce(SRC.Last_Resolved_Date,  SRC.Closed_Date, SRC.Last_Modified_Date))<30
  THEN 'Y'
  WHEN  TIMESTAMPDIFF(MINUTE,SRC.Submit_Date,convert_tz(FRESH.lastupdated,'<<DW_TARGET_TIME_ZONE>>' , '<<TENANT_SSI_TIME_ZONE>>'))<30
AND  L.dimension_wh_code IN('OPEN') THEN 'Y'
WHEN L.dimension_wh_code IN('CANCELED') then null
ELSE 'N' END  <> COALESCE(TRGT.first_call_resolution_flag ,'')