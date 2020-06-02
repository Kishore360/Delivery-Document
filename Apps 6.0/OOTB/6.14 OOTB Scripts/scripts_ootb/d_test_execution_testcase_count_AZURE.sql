SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH validation failed for d_test_execution.testcase_count' ELSE 'SUCCESS' END as Message
/*SELECT TRGT.row_key, TRGT.row_id, 
coalesce(LKP.TC_CN, SRC.totalTests, 0) sr, coalesce(TRGT.testcase_count,'') tg*/

from (select * from #MDS_TABLE_SCHEMA.azure_test_run_final  where cdctype<>'D') SRC
left join  (
select TR.testSuiteKey, TR.testRunKey, TR.sourceinstance,
sum(case when base.tostring like 'Added%case%' then (LENGTH(base.tostring) + 1 - LENGTH(REPLACE(base.tostring, ',', ''))) 
when base.tostring like 'Removed%case%' then (-1) * (LENGTH(base.tostring) + 1 - LENGTH(REPLACE(base.tostring, ',', '')))  
else 0 end) as TC_CN
from (select * from #MDS_TABLE_SCHEMA.azure_test_run_final  where cdctype<>'D') SRC
left join (select distinct TR.testSuiteKey, TR.testRunKey, TR.sourceinstance from #MDS_TABLE_SCHEMA.azure_test_result_final TR where cdctype<>'D') TR
on SRC.__numerify__primary_key = TR.testRunKey and SRC.sourceinstance = TR.sourceinstance
left join #STG_TABLE_SCHEMA.issue_activity_azure_base base
on base.issueid = TR.testSuiteKey and base.sourceinstance=TR.sourceinstance
where base.field = 'TEST_SUITE' and SRC.startedDate >= base.created
group by TR.testSuiteKey, TR.testRunKey, TR.sourceinstance
) LKP
on SRC.__numerify__primary_key = LKP.testRunKey and SRC.sourceinstance = LKP.sourceinstance

left join  #DWH_TABLE_SCHEMA.d_test_execution TRGT
on SRC.__numerify__primary_key=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where coalesce(LKP.TC_CN, SRC.totalTests, 0) <>coalesce(TRGT.testcase_count,'');