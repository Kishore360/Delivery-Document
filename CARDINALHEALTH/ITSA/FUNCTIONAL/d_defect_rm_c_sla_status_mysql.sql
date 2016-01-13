SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from cardinalhealth_mdwdb.f_defect_rm_c a
left  JOIN  cardinalhealth_mdwdb.d_defect_rm_c b
on  b.ROW_ID = a.row_id and a.source_id=b.source_id
left join cardinalhealth_mdwdb.d_lov_map br 
on a.status_rm_src_c_key = br.src_key 
where CASE WHEN br.dimension_wh_code = 'OPEN' THEN 'OPEN' WHEN br.dimension_wh_code <> 'OPEN' AND b.due_date>b.closed_date THEN 'ACHIEVED' ELSE 'BREACHED' END<>b.sla_status)c