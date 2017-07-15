SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
SELECT f.open_to_resolve_duration,TIMESTAMPDIFF(SECOND,a.opened_on,coalesce( a.last_resolved_on,a.changed_on)),a.opened_on, a.closed_on,a.changed_on,a.last_resolved_on
,f.open_to_resolve_duration - TIMESTAMPDIFF(SECOND,a.opened_on,coalesce(a.last_resolved_on,a.changed_on))
from rambus_mdwdb.d_incident a
JOIN  rambus_mdwdb.f_incident f ON a.row_key = f.incident_key
JOIN rambus_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code IN ('CLOSED','RESOLVED')
where -- f.open_to_resolve_duration <> TIMESTAMPDIFF(SECOND,a.opened_on,coalesce(a.last_resolved_on,a.changed_on))
ABS(f.open_to_resolve_duration - TIMESTAMPDIFF(SECOND,a.opened_on,coalesce(a.last_resolved_on,a.changed_on))) <> 0
AND 
ABS(f.open_to_resolve_duration - TIMESTAMPDIFF(SECOND,a.opened_on,coalesce(a.last_resolved_on,a.changed_on))) <> 3600
)a

