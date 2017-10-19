
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(*) as cnt
from  watson_mdsdb.change_request_final a11
 join watson_mdwdb.d_change_request  a12
on a12.row_id= a11.sys_id and a11.sourceinstance=a12.source_id
where case when (a11.u_production_readiness  = 1) then 'Y' else 'N' end <>a11.u_production_readiness_c)a

