SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from bbandt_mdsdb.change_request_final a
 left  JOIN   bbandt_mdwdb.d_change_request b
on  b.ROW_ID=a.SYS_ID and a.sourceinstance=b.source_id
 where a.u_test_results <> b.test_results_c) temp;
