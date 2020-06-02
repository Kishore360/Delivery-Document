SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.time_until_due_date' ELSE 'SUCCESS' END as Message
 FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item TRGT 
 ON concat(SRC.__numerify__primary_key, '')=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map DM 
on concat('STATUS~WORK_ITEM~',upper(SRC.`state`))=DM.src_rowid and SRC.sourceinstance = DM.source_id
 left join 
 (
 SELECT ODF.etl_run_number, ODF.source_id, max(ODF.lastupdated) lastupdated
 from #DWH_TABLE_SCHEMA.d_o_data_freshness ODF
 where ODF.soft_deleted_flag = 'N'
 group by ODF.etl_run_number, ODF.source_id
 )FRESH
 on TRGT.source_id=FRESH.source_id

where CASE WHEN DM.dimension_wh_code in ('COMPLETED', 'RESOLVED', 'CANCELLED') then 0
WHEN TIMESTAMPDIFF(second,CONVERT_TZ(FRESH.lastupdated,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),COALESCE(SRC.msvsts_scheduling_targetdate, SRC.msvsts_cmmi_targetresolvedate))<0 THEN 0
ELSE TIMESTAMPDIFF(second,CONVERT_TZ(FRESH.lastupdated,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),COALESCE(SRC.msvsts_scheduling_targetdate, SRC.msvsts_cmmi_targetresolvedate)) END <> coalesce(TRGT.time_until_due_date,'');