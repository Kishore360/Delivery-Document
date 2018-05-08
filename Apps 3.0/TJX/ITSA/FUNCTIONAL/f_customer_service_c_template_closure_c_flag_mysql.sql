
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from tjx_mdsdb.u_customer_service_final a
left join tjx_mdwdb.f_customer_service_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where c.template_closure_c_flag <> case a.u_template_closure when 1 then 'Y' else 'N' end) g;

