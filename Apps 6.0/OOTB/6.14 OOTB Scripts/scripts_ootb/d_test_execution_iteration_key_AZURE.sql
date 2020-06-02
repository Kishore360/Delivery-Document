SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_test_execution.iteration_key' ELSE 'SUCCESS' END as Message
 
 from (select * from #MDS_TABLE_SCHEMA.azure_test_result_final where cdctype<>'D') SRC
 left join #MDS_TABLE_SCHEMA.azure_test_run_final TR
 on SRC.testRunKey = TR.__numerify__primary_key and SRC.sourceinstance=TR.sourceinstance
 
 left join (select 
CASE WHEN LENGTH(iteration.path) - LENGTH(REPLACE(iteration.path, char(92), ''))=2 
THEN CONCAT(iteration.id+1,'~',proj.organizationKey) 
ELSE   CONCAT(iteration.id,'~',proj.organizationKey) 
END AS sys_id,
iteration.sourceinstance as sourceinstance
from #MDS_TABLE_SCHEMA.azure_iteration_final iteration 
left join #MDS_TABLE_SCHEMA.azure_project_final proj 
on iteration.projectKey = proj.__numerify__primary_key and iteration.sourceinstance = proj.sourceinstance
where iteration.cdctype<>'D') ITE_BASE

on concat(TR.iterationKey, '~', SRC.projectKey) = ITE_BASE.sys_id and SRC.sourceinstance = ITE_BASE.sourceinstance
 
 left join #DWH_TABLE_SCHEMA.d_iteration LKP
 on coalesce(ITE_BASE.sys_id,'UNSPECIFIED')=LKP.row_id and ITE_BASE.sourceinstance=LKP.source_id
 
 left join #DWH_TABLE_SCHEMA.d_test_execution TRGT
on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
 
 where TRGT.soft_deleted_flag <> 'Y' and
 coalesce(LKP.row_key,case when concat(TR.iterationKey, '~', SRC.projectKey) is null then 0 else -1 end )<>coalesce(TRGT.iteration_key,'');