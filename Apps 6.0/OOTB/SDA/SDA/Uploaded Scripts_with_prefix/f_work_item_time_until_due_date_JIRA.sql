SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.time_until_due_date' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.issue_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item TRGT 
 ON concat(SRC.id, '')=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
 LEFT JOIN (select * from #DWH_TABLE_SCHEMA.d_lov_map br where br.dimension_class = 'STATUS~WORK_ITEM') br ON TRGT.work_item_status_src_key = br.src_key and TRGT.source_id = br.source_id
 left join 
 (
 SELECT ODF.etl_run_number, ODF.source_id, max(ODF.lastupdated) lastupdated
 from #DWH_TABLE_SCHEMA.d_o_data_freshness ODF
 where ODF.soft_deleted_flag = 'N'
 group by ODF.etl_run_number, ODF.source_id
 )FRESH
 on TRGT.source_id=FRESH.source_id

where CASE WHEN br.dimension_wh_code in ('COMPLETED', 'RESOLVED', 'CANCELLED') then 0
WHEN TIMESTAMPDIFF(second,CONVERT_TZ(FRESH.lastupdated,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),SRC.duedate)<0 THEN 0
ELSE TIMESTAMPDIFF(second,CONVERT_TZ(FRESH.lastupdated,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),SRC.duedate) END <> coalesce(TRGT.time_until_due_date,'');