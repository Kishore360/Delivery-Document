SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM
(select count(*) as cnt 
from rei_mdwdb.d_internal_contact a 
join rei_mdsdb.sys_user_final b 
ON a.row_id = CONCAT('INTERNAL_CONTACT~',b.sys_id) AND a.source_id = b.sourceinstance
where b.u_resource_cost_component<> a.employment_type)c ;