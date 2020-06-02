 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_test_step.row_count' ELSE 'SUCCESS' END as Message
 from (
 select *
 from
 (select count(*) count_src from #MDS_TABLE_SCHEMA.blz_master_final SRC join (select labelid, sourceinstance, labelname,masterid  from  #MDS_TABLE_SCHEMA.blz_master_aggregate_report_final group by
 sourceinstance,labelid,labelname) SRC1
  on SRC1.masterid=SRC.id where SRC.cdctype<>'D' ) count_src,
 
 (select count(*) count_trgt from #DWH_TABLE_SCHEMA.d_test_step TRGT
  join (select distinct source_id from #DWH_TABLE_SCHEMA.d_o_data_freshness where sourcename = 'Blazemeter_Tenant') ODF on ODF.source_id = TRGT.source_id
  where TRGT.row_key not in (0, -1)) count_trgt
 
 where count_src.count_src <>count_trgt.count_trgt
 )SQ;