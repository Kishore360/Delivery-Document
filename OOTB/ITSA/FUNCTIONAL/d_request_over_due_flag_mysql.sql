SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from <<tenant>>_mdwdb.d_request TRGT
WHERE due_on is not  null and 
COALESCE( CASE WHEN TRGT.active_flag = 'Y' and TRGT.due_on < (SELECT MAX(lastupdated) AS lastupdated
FROM <<tenant>>_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%') then 'Y' else 'N' END,'')<>
 COALESCE(TRGT.over_due_flag ,'')
)a

