

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request.over_due_flag' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sc_request_final WHERE CDCTYPE<>'D') SRC 
  LEFT JOIN #DWH_TABLE_SCHEMA.d_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
   LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) FRESH  ON(FRESH.source_id=SRC.sourceinstance
 -- AND FRESH.etl_run_number = TRGT.etl_run_number
 )
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM
 on concat('REQUEST_STATE~SC_REQUEST~',upper(SRC.request_state) )= LM.src_rowid
and LM.dimension_class='REQUEST_STATE~SC_REQUEST'
 
WHERE CASE WHEN (LM.dimension_wh_code  IN('CLOSED') and coalesce( SRC.closed_at,SRC.sys_updated_on)>coalesce( SRC.due_Date,0) and SRC.due_date is not null)
or (LM.dimension_wh_code  IN ('OPEN') and coalesce( SRC.due_date,0) < convert_tz(FRESH.lastupdated,'<<DW_TARGET_TIME_ZONE>>' , '<<TENANT_SSI_TIME_ZONE>>')
and SRC.due_date is not null and SRC.active=1)
 THEN 'Y' ELSE 'N' END <> coalesce(TRGT.over_due_flag,'') 
