SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_facility_request.over_due_flag' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.facilities_request_final WHERE CDCTYPE<>'D') SRC 
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_facility_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

   
  
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM
 on concat('STATE~FACILITIES_REQUEST~',upper(SRC.state) )= LM.src_rowid
and LM.dimension_class='STATE~FACILITIES_REQUEST' 

LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) FRESH  ON(FRESH.source_id=SRC.sourceinstance
 -- AND FRESH.etl_run_number = TRGT.etl_run_number
 ) 
WHERE CASE WHEN (LM.dimension_wh_code  IN('CLOSED') and coalesce( SRC.closed_at,SRC.sys_updated_on)>coalesce( SRC.due_Date,0) and SRC.due_date is not null)
or (LM.dimension_wh_code  IN ('OPEN') and coalesce( SRC.due_date,0) < convert_tz(FRESH.lastupdated,'<<DW_TARGET_TIME_ZONE>>' , '<<TENANT_SSI_TIME_ZONE>>')
and SRC.due_date is not null and SRC.active=1)
 THEN 'Y' ELSE 'N' END <> TRGT.over_due_flag 

