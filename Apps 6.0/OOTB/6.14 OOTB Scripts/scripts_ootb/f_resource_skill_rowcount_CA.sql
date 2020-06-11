  SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_resource_skill' ELSE 'SUCCESS' END as Message
 from 
 (
 select count_src
 from
 (
 select sourceinstance,count(*) count_src from #MDS_TABLE_SCHEMA.rsm_skills_associations_final SRC 
 where object_code='resource' and cdctype<>'D' group by sourceinstance
 )count_src1
 left outer join
 (
 select source_id,count(*) count_trgt from #DWH_TABLE_SCHEMA.f_resource_skill TRGT 
 where TRGT.row_key not in (0, -1) group by source_id
 ) count_trgt1
 on count_src1.sourceinstance=count_trgt1.source_id 
 where count_src1.count_src<>count_trgt1.count_trgt)SQ