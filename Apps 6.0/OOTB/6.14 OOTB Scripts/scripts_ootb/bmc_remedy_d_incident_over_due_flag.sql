SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.over_due_flag' ELSE 'SUCCESS' END as Message
 
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_hpd_help_desk_final WHERE CDCTYPE<>'D') SRC
   
 LEFT JOIN #DWH_TABLE_SCHEMA.d_incident TRGT 
 ON (SRC.incident_number=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) FRESH  ON(FRESH.source_id=SRC.sourceinstance)
 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM
 on concat('STATE~INCIDENT~',upper(SRC.status) )= LM.src_rowid
and LM.dimension_class='STATE~INCIDENT'
 
WHERE 
CASE WHEN (LM.dimension_wh_code  IN('CLOSED','RESOLVED') 
and coalesce(SRC.Last_Resolved_Date, SRC.Closed_Date,SRC.Last_Modified_Date)>coalesce( SRC.Estimated_Resolution_Date,0) and SRC.Estimated_Resolution_Date is not null)
or (LM.dimension_wh_code  IN ('OPEN') and coalesce( SRC.Estimated_Resolution_Date,0) < convert_tz(FRESH.lastupdated,'<<DW_TARGET_TIME_ZONE>>' , '<<TENANT_SSI_TIME_ZONE>>')
and SRC.Estimated_Resolution_Date is not null /*and SRC.active=1*/)
 THEN 'Y' ELSE 'N' END <> coalesce(TRGT.over_due_flag,'') 