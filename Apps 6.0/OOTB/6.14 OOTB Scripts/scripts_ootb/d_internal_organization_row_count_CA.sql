SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_demand.row_count' ELSE 'SUCCESS' END as Message
  from ( select * from
  (select count(*) count_src,sourceinstance from  #MDS_TABLE_SCHEMA.departments_final SRC where cdctype<>'D') count_src,
 (select count(*)  count_trgt,source_id from
 (select * from  #MDS_TABLE_SCHEMA.departments_final  where cdctype<>'D') sd
 left join (select count(*),source_id from  #DWH_TABLE_SCHEMA.d_internal_organization)trgt
 on sd.sourceinstance=trgt.source_id)count_trgt
  where count_src.count_src <> count_trgt.count_trgt
   )SQ ;
 