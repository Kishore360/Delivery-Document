 
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result

,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from  

starwood_mdsdb.incident_final a

join starwood_mdsdb.sys_user_group_final b on a.assignment_group =b.sys_id and a.sourceinstance=b.sourceinstance

left join starwood_mdwdb.d_incident c 
on a.sys_id=c.row_id and c.source_id=a.sourceinstance

where 
support_tier_c<>
case when  b.u_company ='Accenture' and (b.name not like '%Run%' and 
b.name not like 

'%Maintenance%' ) then 'TIER 1'
when b .u_company ='Accenture' and (b.name like '%Run%') then 'TIER 2'
when b.u_company 

='Accenture' and (b.name like '%Maintenance%') then 'TIER 3' end
)a
