SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_build_project.cobertura_score' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.job_final job
left join  #DWH_TABLE_SCHEMA.f_build_project TRGT
on job.__numerify__primary_key=TRGT.row_id and job.sourceinstance=TRGT.source_id

left join
(
select HRT.score ,HRT.__numerify__parent_key,HRT.sourceinstance 
from #MDS_TABLE_SCHEMA.healthReport_final HRT
right join #MDS_TABLE_SCHEMA.job_final JBH on HRT.__numerify__parent_key= JBH.__numerify__primary_key
and HRT.sourceinstance = JBH.sourceinstance
and HRT.description like '%Cober%' ) SQ

on job.__numerify__primary_key = SQ.__numerify__parent_key and job.sourceinstance = SQ.sourceinstance
where  COALESCE(SQ.score,0) <> COALESCE(TRGT.cobertura_score,'')
