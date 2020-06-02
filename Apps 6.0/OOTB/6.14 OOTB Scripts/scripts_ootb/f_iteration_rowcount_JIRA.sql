 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_iteration' ELSE 'SUCCESS' END as Message
 from (
 select * from
(select count(distinct SRC.row_id) count_src from #STG_TABLE_SCHEMA.f_iteration_temp SRC) count_src,
 
 (select count(*) count_trgt from #DWH_TABLE_SCHEMA.f_iteration TRGT
  join (select distinct source_id from #DWH_TABLE_SCHEMA.d_o_data_freshness where sourcename = 'Jira_Tenant') ODF on ODF.source_id = TRGT.source_id
  where TRGT.soft_deleted_flag = 'N') count_trgt
 
 where count_src.count_src <>count_trgt.count_trgt
 )SQ