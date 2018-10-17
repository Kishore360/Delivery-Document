 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from paloalto_mdsdb.u_walk_up_final s
left  JOIN paloalto_mdwdb.d_walk_up_c t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id 
left  JOIN paloalto_mdwdb.d_lov_map lkp
on lkp.src_key=t.state_src_key and lkp.dimension_wh_code in ('CLOSED','RESOLVED')
WHERE coalesce(t.last_resolved_on,'') <> coalesce(convert_tz(coalesce(s.u_resolved_at),'GMT','America/Los_Angeles'),''))t ;

