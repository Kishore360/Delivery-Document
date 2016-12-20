SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM
(select count(*) as cnt 
from jnj_mdwdb.d_internal_contact a 
join jnj_mdsdb.sys_user_final b 
ON a.row_id = CONCAT('INTERNAL_CONTACT~',b.sys_id) AND a.source_id = b.sourceinstance
join
jnj_mdwdb.d_internal_organization LKP
on COALESCE(b.u_cost_center, 'UNSPECIFIED') = LKP.row_id and LKP.source_id= b.sourceinstance
where COALESCE( LKP.row_key,case when b.u_cost_center  is null then 0 else -1 end) <>  a.cost_center_c_key)c ;