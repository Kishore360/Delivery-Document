SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from (
 select a.sys_id,b.row_id,
case when d.revenue_impacting_c_flag='Y' 
and z.name in ('Service Desk San Antonio', 'Service Desk Direct Connect')
AND a.reassignment_count = 0
THEN 1 ELSE 0        end ,b.fcr_revenue_impacting_c
from    starwood_mdsdb.incident_final a
join starwood_mdsdb.sys_user_group_final z on z.sys_id=a.assignment_group
left join starwood_mdwdb.d_incident d on a.sys_id=d.row_id and d.source_id=a.sourceinstance
left JOIN  starwood_mdwdb.f_incident b 
on d.row_id=b.row_id and d.source_id=b.source_id
left join starwood_mdwdb.d_lov_map c on 
b.state_src_key =c.src_key and c.dimension_class = 'STATE~INCIDENT'
and c.dimension_wh_code = 
'RESOLVED'
where  
case when d.revenue_impacting_c_flag='Y' 
and z.name in ('Service Desk San Antonio', 'Service Desk Direct Connect') 
AND a.reassignment_count = 0
THEN 1 ELSE 0        end <>b.fcr_revenue_impacting_c
)e)J