
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from  intuit_mdwdb.d_incident_task_c b
left join intuit_mdwdb.f_incident_task_c l1
ON b.row_key=l1.incident_task_key  AND  b.source_id=l1.source_id 
left join intuit_mdwdb.d_lov_map l2
on l1.state_src_key=l2.src_key 
WHERE l2.dimension_class = 'STATE~INCIDENT'
  AND l2.dimension_wh_code = 'OPEN' AND case when  timestampdiff(day,b.changed_on,(SELECT MAX(lastupdated) AS lastupdated
FROM intuit_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'))>30  then 'Y' else 'N'
end <> b.dormant_flag ) temp;