select 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'f_incident.resolved_by failed' ELSE 'Data Matched' END AS Message
FROM (SELECT count(1) as CNT
from <<tenant>>_mdsdb.incident_final x 
left outer join <<tenant>>_mdwdb.d_internal_contact y on
CONCAT('INTERNAL_CONTACT~',x.resolved_by)=y.row_id  AND sourceinstance= source_id
 JOIN   <<tenant>>_mdwdb.f_incident B on B.ROW_ID=SYS_ID and x.sourceinstance=B.source_id 
left join <<tenant>>_mdwdb.d_lov_map map on B.state_src_key = map.src_key
left join <<tenant>>_mdwdb.d_lov lov on B.state_src_key = lov.row_key
WHERE map.dimension_wh_code in ('CLOSED','RESOLVED') and last_resolved_by_key<>
coalesce(y.row_key,case when resolved_by is null then 0 else -1 end))temp;