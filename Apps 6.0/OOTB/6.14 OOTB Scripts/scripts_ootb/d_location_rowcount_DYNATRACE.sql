SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_internal_contact' ELSE 'SUCCESS' END as Message
 from (
 select *
 from
 (select count(*) count_src, source_id1 from(select distinct(name), sourceinstance as source_id1 from  #MDS_TABLE_SCHEMA.synthetic_location_detail_final where cdctype<>'D') SRC group by source_id1) count_src,
 
 (select count(*) count_trgt, source_id from #DWH_TABLE_SCHEMA.d_location  TRGT where TRGT.row_key not in (0, -1) group by source_id) count_trgt
 
 where  count_src.source_id1 =count_trgt.source_id
 and count_src.count_src <>count_trgt.count_trgt
 )SQ