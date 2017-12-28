SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select  count(1) cnt 
from svb_mdsdb.cmdb_ci_final a
left JOIN svb_mdwdb.d_configuration_item b
on 
a.sys_id=b.row_id AND a.sourceinstance=b.source_id
LEFT  JOIN  svb_mdwdb.d_internal_contact c
on CONCAT('INTERNAL_CONTACT~',a.u_portfolio_owner)= c.ROW_ID 
AND c.source_id = a.sourceinstance
where 
case when a.u_portfolio_owner is null then 0
when  a.u_portfolio_owner is not null and c.row_key is null then -1
else 
c.row_key end <> b.portfolio_owner_c_key )b