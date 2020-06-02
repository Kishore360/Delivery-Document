SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_snapshot_weekly.source_id' ELSE 'SUCCESS' END as Message
FROM #STG_TABLE_SCHEMA.hier_base SRC
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_h_all_hierarchies TRGT 
 ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
 
WHERE TRGT.soft_deleted_flag = 'N' and COALESCE(SRC.sourceinstance, '')<> COALESCE(TRGT.source_id ,'');