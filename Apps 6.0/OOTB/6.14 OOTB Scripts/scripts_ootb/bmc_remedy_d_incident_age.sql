select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.age' ELSE 'SUCCESS' END as Message
 
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_hpd_help_desk_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_incident TRGT 
 ON (SRC.incident_number=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
left join #DWH_TABLE_SCHEMA.d_lov_map L 
 ON (SRC.status=L.dimension_code
 AND SRC.sourceinstance=L.source_id AND L.dimension_class = 'STATE~INCIDENT' )
    
LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) df 
  ON (TRGT.source_id = df.source_id )
 
where L.dimension_class = 'STATE~INCIDENT'
and case when L.dimension_wh_code in ('OPEN') 
    then case when coalesce( SRC.Submit_Date,0)> convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>' , '<<TENANT_SSI_TIME_ZONE>>') then 0 else
    TIMESTAMPDIFF(DAY, coalesce( SRC.Submit_Date,0), convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>' , '<<TENANT_SSI_TIME_ZONE>>')) end
               else 
                case when  SRC.Submit_Date>coalesce( SRC.Last_Resolved_Date,  SRC.Closed_Date, SRC.Last_Modified_Date) then 0 else
                TIMESTAMPDIFF(DAY, coalesce(SRC.Submit_Date,0),coalesce( SRC.Last_Resolved_Date,  SRC.Closed_Date, SRC.Last_Modified_Date,0))
		end end  <>TRGT.age