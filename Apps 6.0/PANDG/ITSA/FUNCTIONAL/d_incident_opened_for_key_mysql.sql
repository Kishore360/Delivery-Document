SELECT
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match' ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from pandg_mdsdb.incident_final s
LEFT JOIN pandg_mdwdb.d_incident t on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id 
join pandg_mdwdb.d_internal_contact l
on  concat('INTERNAL_CONTACT~',s.u_opened_for )= l.row_id and s.sourceinstance=l.source_id
WHERE t.opened_for_key <> COALESCE(l.row_key,CASE WHEN s.u_opened_for IS NULL THEN 0 else -1 end)
)temp;

