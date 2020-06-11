 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_test_execution_result.row_count' ELSE 'SUCCESS' END as Message
 from (
 select *
 from
 (select count(*) count_src from #MDS_TABLE_SCHEMA.blz_master_aggregate_report_final SRC 
 join #MDS_TABLE_SCHEMA.blz_master_final SRC1
 on SRC.masterid=SRC1.id where SRC.cdctype<>'D' ) count_src,
 
 (select count(*) count_trgt from #DWH_TABLE_SCHEMA.f_test_execution_result TRGT
  join (select distinct source_id from #DWH_TABLE_SCHEMA.d_o_data_freshness where sourcename = 'Blazemeter_Tenant') ODF on ODF.source_id = TRGT.source_id
  where TRGT.row_key not in (0, -1)) count_trgt
 
 where count_src.count_src <>count_trgt.count_trgt
 )SQ;