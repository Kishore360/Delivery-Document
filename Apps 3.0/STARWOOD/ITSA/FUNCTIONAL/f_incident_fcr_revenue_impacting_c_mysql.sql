
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation  failed for d_incident.backlog_flag' ELSE 'SUCCESS' END as Message
from    starwood_mdsdb.incident_final a
left join  starwood_mdwdb.d_incident d on a.sys_id=d.row_id and d.source_id=a.sourceinstance
left JOIN  starwood_mdwdb.f_incident b 
on  d.row_id=b.row_id and d.source_id=b.source_id
join starwood_mdwdb.d_internal_organization z  ON z.row_key = b.assignment_group_key
 join  starwood_mdwdb.d_lov_map c on 
b.state_src_key =c.src_key and c.dimension_class = 'STATE~INCIDENT'
and c.dimension_wh_code = 'RESOLVED'
where  
case when d.revenue_impacting_c_flag='Y' 
and z.organization_name in ('Service Desk San Antonio', 'Service Desk Direct Connect') 
AND a.reassignment_count = 0 and c.dimension_wh_code = 'RESOLVED'
THEN 1 ELSE 0        end <>b.fcr_revenue_impacting_c