select case when count(*)>0 then 'FAILURE'else 'SUCCESS' end as Result,
case when count(*)>0 then '#SCENARIO FAILED. Check app_test.system_test_results for details' else 'SUCCESS' end Message
from  app_test.system_test_results
where test_run_id=(select test_run_id FROM app_test.test_summary
WHERE test_suite_name like concat('%#TENANT_NAME%') ORDER BY start_time DESC LIMIT 1)
and result='FAILURE' and scenario='#SCENARIO';