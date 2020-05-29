SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_master_item.generic_ci_flag' ELSE 'SUCCESS' END as Message
-- select  (case when SRC.sys_id is not null then 'Y' else 'N' end),  coalesce (TRGT.generic_ci_flag,''),SRC.sys_id,TRGT.item_number
 from ( SELECT * FROM #MDS_TABLE_SCHEMA.us_generic_catalog_item_smpo_final WHERE CDCTYPE<>'D') SRC
  left join  #DWH_TABLE_SCHEMA.d_master_item TRGT
 on  SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
 where (case when SRC.sys_id is not null then 'Y' else 'N' end) <> coalesce (TRGT.generic_ci_flag,'');