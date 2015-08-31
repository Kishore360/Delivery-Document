 
select count(1) from(
select d.isac_c_flag , o.organization_name , b.reassignment_count, d.sla_recall_made_c_flag, d.met_sla_flag 
, end_to_end_duration
,fcr_isac_c,case when d.isac_c_flag ='Y' 
and o.organization_name = 'ISAC Service Desk'
AND b.reassignment_count = 0 and d.sla_recall_made_c_flag='Y' 
and d.met_sla_flag='Y'
and end_to_end_duration =1 then 1 else 0 end
from    ldb.f_incident b 
 join starwood_mdwdb.d_lov z on b.incident_met_sla_c_key=z.row_key and dimension_code like '%MET_SLA%'
left join starwood_mdwdb.d_lov_map c on 
b.state_src_key =c.src_key and c.dimension_class = 'STATE~INCIDENT'
and c.dimension_wh_code ='RESOLVED'
LEFT JOIN starwood_mdwdb.d_internal_organization o
ON b.assignment_group_key = o.row_key
left JOIN starwood_mdwdb.d_incident d on b.row_id=d.row_id and b.source_id=d.source_id
where fcr_isac_c<>
case when d.isac_c_flag ='Y' 
and o.organization_name = 'ISAC Service Desk'
AND b.reassignment_count = 0 and d.sla_recall_made_c_flag='Y' 
and end_to_end_duration =1 then 1 else 0 end
)A