SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_build_project.tests_passed' ELSE 'SUCCESS' END as Message

from #MDS_TABLE_SCHEMA.job_final job
left join  #DWH_TABLE_SCHEMA.f_build_project TRGT
on job.__numerify__primary_key=TRGT.row_id and job.sourceinstance=TRGT.source_id
left join 
(
SELECT build.__numerify__parent_key,build.sourceinstance ,sum(coalesce(TRP.passCount,TRS1.passCount,0)) passcount
FROM #MDS_TABLE_SCHEMA.job_final job left join #MDS_TABLE_SCHEMA.build_final build 
on job.lastBuild = build.__numerify__primary_key and job.sourceinstance = build.sourceinstance

left join #MDS_TABLE_SCHEMA.testReport_final TRS
on TRS.__numerify__parent_key = build.__numerify__primary_key and TRS.sourceinstance = build.sourceinstance

left join #MDS_TABLE_SCHEMA.testResult_final TRP
on TRP.__numerify__parent_key = TRS.__numerify__primary_key and TRP.sourceinstance = TRS.sourceinstance

left join #MDS_TABLE_SCHEMA.testResult_final TRS1
on TRS1.__numerify__parent_key = build.__numerify__primary_key and TRS1.sourceinstance = build.sourceinstance

group by build.__numerify__parent_key ,build.sourceinstance
) SQ
on job.__numerify__primary_key = SQ.__numerify__parent_key and job.sourceinstance=SQ.sourceinstance
where  COALESCE(SQ.passcount,0) <> COALESCE(TRGT.tests_passed,'');