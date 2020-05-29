SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_burn_down.work_item_iteration_m2m_key' ELSE 'SUCCESS' END as Message
FROM #STG_TABLE_SCHEMA.burn_down_temp SRC
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_burn_down TRGT 
 ON (SRC.sys_id = TRGT.row_id 
 AND SRC.source_id=TRGT.source_id)
 
 left join #DWH_TABLE_SCHEMA.d_iteration LKP
 on (LKP.row_id = SRC.iteration_id
 and LKP.source_id = SRC.source_id)
 
WHERE TRGT.soft_deleted_flag = 'N' and coalesce(LKP.row_key, case when SRC.iteration_id is null then 0 else -1 end) <> coalesce(TRGT.work_item_iteration_m2m_key,0);