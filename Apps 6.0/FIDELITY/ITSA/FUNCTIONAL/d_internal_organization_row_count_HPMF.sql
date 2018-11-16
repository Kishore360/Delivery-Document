  SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_internal_organization.row_count' ELSE 'SUCCESS' END as Message
  from ( select * from 
 (select count(*) count_src from fidelity_mdsdb.hp_rsc_resource_pools_final ) count_src,
 (select count(*) count_trgt from fidelity_mdwdb.d_internal_organization TRGT where TRGT.row_key not in (0, -1) and TRGT.row_id like '%GROUP~%'
 and TRGT.source_id = 11) count_trgt
 where count_src.count_src <> count_trgt.count_trgt
 )SQ;