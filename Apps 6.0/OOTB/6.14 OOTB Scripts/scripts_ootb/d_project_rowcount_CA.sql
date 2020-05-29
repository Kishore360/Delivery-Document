SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_resource_role' ELSE 'SUCCESS' END as Message
 from (
 select *
 from
(select SRC1.sourceinstance, count(*) count_src from
(select id,sourceinstance from #MDS_TABLE_SCHEMA.inv_investments_final  where odf_object_code='project' and cdctype<>'D')SRC1
inner join 
(select PRID,sourceinstance from #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC2
on SRC1.id=SRC2.PRID and SRC1.sourceinstance=SRC2.sourceinstance) count_src
left outer join
(select source_id, count(*) count_trgt from #DWH_TABLE_SCHEMA.d_project where row_key not in (0, -1) 
 group by source_id) count_trgt
 on count_src.sourceinstance=count_trgt.source_id
 
where count_src.count_src <>count_trgt.count_trgt
 )SQ