SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 then case when (COALESCE(SRC.age_since_creation,0) - coalesce(TRGT.age_since_creation,'')) in (-3600, 3600) 
 then 'Failing due to timezone conversion issue for f_work_item_snapshot_monthly.age_since_creation'
 ELSE  'MDS to DWH data validation failed for f_work_item_snapshot_monthly.age_since_creation' END ELSE 'SUCCESS' END as Message
/*select TRGT.row_id, SR.row_id,
  COALESCE(SRC.age_since_creation,0) sr, COALESCE(TRGT.age_since_creation ,'') tg*/
FROM #STG_TABLE_SCHEMA.f_work_item_snpst_mn_base SRC

LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_snapshot_monthly TRGT 
ON (SRC.row_id = TRGT.row_id 
AND SRC.source_id=TRGT.source_id AND SRC.n_key=TRGT.n_key)
 
WHERE TRGT.soft_deleted_flag = 'N' and COALESCE(SRC.age_since_creation,0) <> COALESCE(TRGT.age_since_creation ,'');