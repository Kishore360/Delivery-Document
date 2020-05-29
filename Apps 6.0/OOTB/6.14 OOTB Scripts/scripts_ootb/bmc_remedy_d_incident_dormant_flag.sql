SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_hpd_help_desk_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_incident TRGT 
 ON (SRC.incident_number=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
  LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map L
 ON (SRC.status=L.dimension_code
 AND SRC.sourceinstance=L.source_id AND L.dimension_class = 'STATE~INCIDENT' )
 LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 )   FRESH 
 ON(FRESH.source_id=SRC.sourceinstance) 
 WHERE  CASE WHEN timestampdiff(DAY,TRGT.changed_on,FRESH.lastupdated)>30
AND  L.dimension_wh_code='OPEN' THEN 'Y' ELSE 'N' END  <> COALESCE(TRGT.dormant_flag ,'')