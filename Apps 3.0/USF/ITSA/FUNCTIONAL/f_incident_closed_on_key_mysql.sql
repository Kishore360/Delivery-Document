 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message from
(select count(1) as cnt
from usf_mdwdb.f_incident
join usf_mdwdb.d_lov_map
on src_key = state_src_key
where last_resolved_on_key <> closed_on_key
AND dimension_wh_code != 'OPEN')a