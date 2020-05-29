--- due to data issue failing for 3 records--
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.overdue_flag' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_change_request TRGT 
 ON (SRC.infrastructure_change_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM
 on concat('STATE~CHANGE_REQUEST~',upper(SRC.change_request_status) )= LM.src_rowid
and LM.dimension_class='STATE~CHANGE_REQUEST' 
and LM.source_id=SRC.sourceinstance

LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id
 ) FRESH  ON(FRESH.source_id=SRC.sourceinstance
 -- AND FRESH.etl_run_number = TRGT.etl_run_number
 ) 
WHERE CASE WHEN (LM.dimension_wh_code  IN('CLOSED') and coalesce( SRC.actual_end_date,SRC.scheduled_end_date)>coalesce( SRC.change_target_date,0) and SRC.change_target_date is not null)
or (LM.dimension_wh_code  IN ('OPEN') and coalesce( SRC.change_target_date,0) < convert_tz(FRESH.lastupdated,'<<DW_TARGET_TIME_ZONE>>' , '<<TENANT_SSI_TIME_ZONE>>')
and SRC.change_target_date is not null)
 THEN 'Y' ELSE 'N' END <> TRGT.overdue_flag