SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_build_project.builds_total' ELSE 'SUCCESS' END as Message
from  #MDS_TABLE_SCHEMA.azure_build_definition_final job
left join  #DWH_TABLE_SCHEMA.f_build_project TRGT
on job.__numerify__primary_key=TRGT.row_id and job.sourceinstance=TRGT.source_id
left join
(
select build.definitionKey, build.sourceinstance, 
count(case when build.__numerify__primary_key is not null then build.__numerify__primary_key else null end) as total_builds_count
from #MDS_TABLE_SCHEMA.azure_build_final build
group by build.definitionKey, build.sourceinstance
) SQ
on job.__numerify__primary_key = SQ.definitionKey and job.sourceinstance=SQ.sourceinstance
where  COALESCE(SQ.total_builds_count,0) <> COALESCE(TRGT.builds_total, '');