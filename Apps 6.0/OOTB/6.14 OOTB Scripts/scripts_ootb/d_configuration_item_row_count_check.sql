  SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_configuration_item' ELSE 'SUCCESS' END as Message
  from 
 (select count(*) count_src,sourceinstance from #MDS_TABLE_SCHEMA.cmdb_ci_final 
 group by sourceinstance) count_src left join
 (select count(*)  count_trgt,source_id from #DWH_TABLE_SCHEMA.d_configuration_item 
 where row_key not in (0, -1) group by source_id)count_trgt
 on count_src.sourceinstance = count_trgt.source_id
 where coalesce(count_src.count_src,'') <> coalesce(count_trgt.count_trgt,'')