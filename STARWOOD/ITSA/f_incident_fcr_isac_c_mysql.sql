
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.backlog_flag' ELSE 'SUCCESS' END as Message
from     starwood_mdwdb.f_incident b 
join (select max(lastupdated) as last_updated,source_id from starwood_mdwdb.d_o_data_freshness group by 2)  f
on b.source_id=f.source_id
 join starwood_mdwdb.d_lov z on b.incident_met_sla_c_key=z.row_key and dimension_code like '%MET_SLA%'
left  join starwood_mdwdb.d_lov_map c on 
b.state_src_key =c.src_key and c.dimension_class = 'STATE~INCIDENT'
and c.dimension_wh_code  IN ('CLOSED','RESOLVED')
LEFT JOIN starwood_mdwdb.d_internal_organization o
ON b.assignment_group_key = o.row_key
left JOIN starwood_mdwdb.d_incident  d on b.row_id=d.row_id and b.source_id=d.source_id
where fcr_isac_c<>
case when d.isac_c_flag ='Y' 
and o.organization_name = 'ISAC Service Desk'
AND b.reassignment_count = 0 and d.sla_recall_made_c_flag='Y' and z.dimension_name like '%MET_SLA%'
and   (b.open_to_resolve_duration/3600 < 96 or b.open_to_close_duration/3600 < 96 )
AND c.dimension_wh_code in ('RESOLVED','CLOSED') then 1 else 0 end 
