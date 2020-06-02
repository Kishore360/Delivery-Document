SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.days_until_due_date' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.issue_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item TRGT 
 ON concat(SRC.id, '')=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
 
 left join 
 (
 SELECT ODF.etl_run_number, ODF.source_id, max(ODF.lastupdated) lastupdated
 from #DWH_TABLE_SCHEMA.d_o_data_freshness ODF
 where ODF.soft_deleted_flag = 'N'
 group by ODF.etl_run_number, ODF.source_id
 )FRESH
 on TRGT.etl_run_number=FRESH.etl_run_number

where CASE WHEN TIMESTAMPDIFF(DAY,FRESH.lastupdated,CONVERT_TZ(SRC.duedate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'))<0 THEN 0
ELSE TIMESTAMPDIFF(DAY,FRESH.lastupdated,CONVERT_TZ(SRC.duedate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) END <> coalesce(TRGT.days_until_due_date,'');
