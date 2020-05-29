 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Row count failed for f_a_request_item_smpo_dppc' ELSE 'SUCCESS' END as Message
 from (
 select * from
(select count(*) count_src from #STG_TABLE_SCHEMA.f_a_request_item_smpo_dppc_base SRC) count_src,
 
 (select count(*) count_trgt from #DWH_TABLE_SCHEMA.f_a_request_item_smpo_dppc TRGT
  where TRGT.soft_deleted_flag = 'N') count_trgt
 
 where count_src.count_src <>count_trgt.count_trgt
 )SQ