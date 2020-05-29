  SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_configuration_item' ELSE 'SUCCESS' END as Message
  from 
 (select count(*) count_src,sourceinstance from #MDS_TABLE_SCHEMA.cmdb_ci_final ) count_src,
 (select count(*)  count_trgt,source_id from #DWH_TABLE_SCHEMA.f_configuration_item )count_trgt
  where count_src.count_src <> count_trgt.count_trgt                                 