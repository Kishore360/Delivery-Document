SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from pan_mdsdb.change_request_final a
 left  JOIN  pan_mdwdb.d_change_request b
on  a.SYS_ID= b.ROW_ID and a.sourceinstance=b.source_id
 where a.u_post_implementation_validation <> b.post_implementation_validation_c ) b