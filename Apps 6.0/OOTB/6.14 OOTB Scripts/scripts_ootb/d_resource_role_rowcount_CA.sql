SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_resource_role' ELSE 'SUCCESS' END as Message
  from (
 select count_src
 from
  (select SRC1.sourceinstance,count(*) count_src from
((select sourceinstance,id from #MDS_TABLE_SCHEMA.srm_resources_final  where cdctype<>'D')SRC1
inner join 
(select sourceinstance,PRID from #MDS_TABLE_SCHEMA.prj_resources_final where prisrole=1 and cdctype<>'D')SRC2
on SRC1.id=SRC2.PRID AND SRC1.sourceinstance=SRC2.sourceinstance)) count_src
 left outer join
 (select source_id,count(*) count_trgt from #DWH_TABLE_SCHEMA.d_resource_role TRGT where TRGT.row_key not in (0, -1)
 group by source_id) count_trgt
 on count_src.sourceinstance=count_trgt.source_id where count_src.count_src <>count_trgt.count_trgt)SQ
 