
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt 
from pan6_mdsdb.u_service_request_final a
left join pan6_mdwdb.d_service_request_c b 
on a.sys_id=b.row_id and a.sourceinstance=b.source_id  
where case when a.u_capex = 1 then 'Y' else 'N' end <>b.capex_flag
)i; 
