SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_h_all_hierarchies.lev_4_key' ELSE 'SUCCESS' END as Message
FROM #STG_TABLE_SCHEMA.hier_base SRC
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_h_all_hierarchies TRGT 
 ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item LKP 
 ON (SRC.lev_4_id = LKP.row_id AND SRC.sourceinstance=LKP.source_id) 
 
WHERE TRGT.soft_deleted_flag = 'N' and COALESCE(LKP.row_key, 0)<> COALESCE(TRGT.lev_4_key ,'');