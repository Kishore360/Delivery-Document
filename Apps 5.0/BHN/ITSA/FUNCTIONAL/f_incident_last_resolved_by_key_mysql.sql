SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
bhn_mdsdb.incident_final a
join bhn_mdwdb.f_incident b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
 left join bhn_mdwdb.d_lov_map lm 
 ON (lm.src_key = b.state_src_key)
 left join bhn_mdwdb.d_internal_contact c
on a.sourceinstance=c.source_id
and c.row_id=case when a.resolved_by is null then 'UNSPECIFIED' else concat('INTERNAL_CONTACT~',a.resolved_by) end
where lm.dimension_class = 'STATE~INCIDENT'
AND  lm.dimension_wh_code in  ('RESOLVED') and c.row_key<>b.last_resolved_by_key;