 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
svb_mdwdb.d_incident ds
join svb_mdwdb.d_lov_map dlm 
	ON ds.close_code_src_key = dlm.src_key
and dlm.dimension_wh_code <> 'INVALID INCIDENT'
where case when ds.last_resolved_on < ds.resolve_deadline_c then 'Y' else 'N' END <>ds.resolved_flag_C
 )c
