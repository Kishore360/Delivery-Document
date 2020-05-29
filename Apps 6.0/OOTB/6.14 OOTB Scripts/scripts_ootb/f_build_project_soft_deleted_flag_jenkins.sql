SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_build_project.soft_deleted_flag' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.job_final job
left join  #DWH_TABLE_SCHEMA.f_build_project TRGT
on job.__numerify__primary_key=TRGT.row_id and job.sourceinstance=TRGT.source_id
where COALESCE(case when job.cdctype = 'D' then 'Y' else 'N' end,'')<>COALESCE(TRGT.soft_deleted_flag,'')
