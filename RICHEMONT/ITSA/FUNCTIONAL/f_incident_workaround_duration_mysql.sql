SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from richemont_mdwdb.f_incident a
inner join richemont_mdwdb.d_incident b
on a.incident_key=b.row_key
left join richemont_mdwdb.d_problem c
on a.problem_key=c.row_key
left join richemont_mdwdb.f_problem f
on f.problem_key=c.row_key
left join richemont_mdwdb.d_service d
on a.business_service_key=d.row_key
left join richemont_mdwdb.d_lov_map e
on f.state_src_key=e.src_key
left join richemont_mdwdb.d_lov g
on d.technical_impact_c_key=g.row_key
where a.problem_key<>0 
and c.external_reference_c is not null
and e.dimension_wh_code='CLOSED'
and g.dimension_code='SAP'
and a.workaround_duration_c<>timestampdiff(second,b.opened_on,c.closed_on)
) b
