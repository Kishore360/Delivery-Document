SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from bbandt_mdsdb.change_request_final a
 left  JOIN   bbandt_mdwdb.d_change_request b
on  b.ROW_ID=a.SYS_ID and a.sourceinstance=b.source_id
 where convert_tz(a.u_cab_review_date,'GMT','America/New_York') <> b.cab_review_on_c) temp;
