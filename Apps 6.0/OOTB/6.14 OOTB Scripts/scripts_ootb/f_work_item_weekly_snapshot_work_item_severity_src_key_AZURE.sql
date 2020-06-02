SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_snapshot_weekly.work_item_severity_src_key' ELSE 'SUCCESS' END as Message

FROM #STG_TABLE_SCHEMA.f_work_item_snpst_wk_base SRC

LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_snapshot_weekly TRGT 
ON (SRC.row_id = TRGT.row_id 
AND SRC.source_id=TRGT.source_id AND SRC.n_key=TRGT.n_key)
 
WHERE TRGT.soft_deleted_flag = 'N' and COALESCE(SRC.work_item_severity_src_key,0) <> COALESCE(TRGT.work_item_severity_src_key ,'');