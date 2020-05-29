  SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_relationship_type.row_count' ELSE 'SUCCESS' END as Message
 from ( select  * from
 (select count(*) count_src from #MDS_TABLE_SCHEMA.cmdb_rel_type_final  SRC where cdctype<>'D') count_src,
 (select count(*) count_trgt from #DWH_TABLE_SCHEMA.d_relationship_type TRGT 
  join (select distinct source_id from #DWH_TABLE_SCHEMA.d_o_data_freshness) ODF on ODF.source_id = TRGT.source_id
 where TRGT.row_key not in (0, -1) and TRGT.soft_deleted_flag = 'N') count_trgt
 where coalesce(count_src.count_src,'') <> coalesce(count_trgt.count_trgt,'')
 )SQ ;