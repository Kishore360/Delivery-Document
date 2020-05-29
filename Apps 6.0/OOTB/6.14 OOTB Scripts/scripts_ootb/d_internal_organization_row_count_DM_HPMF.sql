  SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_internal_organization.row_count' ELSE 'SUCCESS' END as Message
  from ( select  count_src.count_src, count_trgt.count_trgt from 
 (select count(*) count_src,sourceinstance from #MDS_TABLE_SCHEMA.hp_knta_lookups_nls_final where LOOKUP_TYPE='DEPT') count_src,
 (select count(*) count_trgt,source_id from #DWH_TABLE_SCHEMA.d_internal_organization TRGT where TRGT.row_key not in (0, -1) and TRGT.row_id like '%DEPARTMENT~%') count_trgt
 where count_src.count_src <> count_trgt.count_trgt
  and count_src.sourceinstance=count_trgt.source_id
 )SQ;