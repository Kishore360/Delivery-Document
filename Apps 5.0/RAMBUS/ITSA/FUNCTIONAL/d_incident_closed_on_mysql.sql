
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1)  cnt  from 
rambus_mdwdb.d_incident a
JOIN  rambus_mdwdb.f_incident f ON a.row_key = f.incident_key
JOIN rambus_mdwdb.d_lov_map br ON (f.state_src_key = br.src_key 
AND br.dimension_class in ('STATE~INCIDENT','STATE~ADHOC_REQ'))
where a.closed_on <> coalesce( a.closed_on,a.changed_on))A;