 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_work_item_burn_down' ELSE 'SUCCESS' END as Message
 from (
 select * from
(select count(*) count_src from #STG_TABLE_SCHEMA.burn_down_temp_azure SRC where SRC.work_item_key not in (0,-1)) count_src,
 
 (select count(*) count_trgt from #DWH_TABLE_SCHEMA.f_work_item_burn_down TRGT
  join (select distinct source_id from #DWH_TABLE_SCHEMA.d_o_data_freshness where sourcename = 'Azure_Tenant' and soft_deleted_flag <> 'Y') ODF on ODF.source_id = TRGT.source_id
  where TRGT.soft_deleted_flag = 'N' and TRGT.work_item_key not in (0,-1)) count_trgt
 
 where count_src.count_src <>count_trgt.count_trgt
 )SQ