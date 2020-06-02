SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_iteration.row_count' ELSE 'SUCCESS' END as Message
 from (
 select *
 from
 (select count(*) count_src from
 (select SRC.* from #STG_TABLE_SCHEMA.workitem_temp_azure SRC
 left join #DWH_TABLE_SCHEMA.d_lov_map b 
 ON concat('TYPE~WORK_ITEM~',SRC.workItemType) = b.src_rowid and SRC.sourceinstance = b.source_id 
 where  b.dimension_wh_code = 'EPIC' and SRC.cdctype <> 'D') SRC ) count_src,
 
 (select count(*) count_trgt from #DWH_TABLE_SCHEMA.d_work_item_epic TRGT 
 join (select distinct source_id from #DWH_TABLE_SCHEMA.d_o_data_freshness where sourcename = 'Azure_Tenant' and soft_deleted_flag <> 'Y') ODF on ODF.source_id = TRGT.source_id
 where TRGT.row_key not in (0, -1) and TRGT.soft_deleted_flag <> 'Y') count_trgt
 
 where count_src.count_src <> count_trgt.count_trgt
 )SQ;
 