


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.u_incident_task_final  a
left join intuit_mdwdb.d_incident_task_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
left join intuit_mdwdb.f_incident_task_c l1
ON b.row_key=l1.incident_task_key  AND  b.source_id=l1.source_id 
left join intuit_mdwdb.d_lov_map l2
on l1.state_src_key=l2.src_key 
JOIN   intuit_mdwdb.d_o_data_freshness l3
ON     l3.etl_run_number = l1.etl_run_number AND    l3.source_id = l1.source_id
WHERE case when  timestampdiff(day,b.changed_on,l3.lastupdated)>30 AND  l2.dimension_wh_code='OPEN' then 'Y' else 'N'
end <> b.dormant_flag ) temp

