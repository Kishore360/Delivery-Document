 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for D_BUILD_RUN' ELSE 'SUCCESS' END as Message
 from (
 select *
 from
 (select count(*) count_src from #MDS_TABLE_SCHEMA.BUILD_final SRC) count_src,
 
 (select count(*) count_trgt from #DWH_TABLE_SCHEMA.D_BUILD_RUN TRGT where TRGT.row_key not in (0, -1) and TRGT.source_id = ) count_trgt
 
 where count_src.count_src <>count_trgt.count_trgt
 )SQ