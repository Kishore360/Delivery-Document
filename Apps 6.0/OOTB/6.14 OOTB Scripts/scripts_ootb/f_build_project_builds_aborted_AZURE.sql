SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_build_project.builds_aborted' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.azure_build_definition_final job
left join  #DWH_TABLE_SCHEMA.f_build_project TRGT
on job.__numerify__primary_key=TRGT.row_id and job.sourceinstance=TRGT.source_id
left join
(
select build.definitionKey, build.sourceinstance, 
count(case when build.__numerify__primary_key is not null and rslt.dimension_wh_code = 'CANCELLED' 
then rslt.row_key else null end) as builds_aborted_count
from #MDS_TABLE_SCHEMA.azure_build_final build
left join #DWH_TABLE_SCHEMA.d_lov_map sts
on concat('STATE~BUILD~',build.status) = sts.src_rowid and build.sourceinstance=sts.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map rslt
on concat('RESULT~BUILD~',build.result) = rslt.src_rowid and build.sourceinstance=rslt.source_id
group by build.definitionKey, build.sourceinstance
) SQ
on job.__numerify__primary_key = SQ.definitionKey and job.sourceinstance=SQ.sourceinstance
where  COALESCE(SQ.builds_aborted_count,0) <> COALESCE(TRGT.builds_aborted,'');


