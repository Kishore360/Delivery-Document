SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from pgi_mdwdb.d_incident f 
join 
( SELECT max(created_on) AS created_on, 
task_row_id, 
source_id 
FROM pgi_workdb.fs_t_task_activity
WHERE task_wh_type IN ('u_internal_incident','u_external_incident')
AND task_attribute_wh_name =  'category' 
GROUP BY task_row_id,source_id)ta
ON  f.row_id = ta.task_row_id 
AND f.source_id = ta.source_id   
JOIN pgi_workdb.fs_t_task_activity ta_latest ON f.row_id = ta_latest.task_row_id 
AND f.source_id = ta_latest.source_id 
AND ta.created_on = ta_latest.created_on
AND ta_latest.task_wh_type IN ('u_internal_incident','u_external_incident')
AND ta_latest.task_attribute_wh_name =  'category' 
where case WHEN ta_latest.task_attribute_wh_old_value = 'Parent Ticket (Analysis)' 
AND ta_latest.task_attribute_wh_new_value = 'Parent Ticket (NOC)' 
THEN ta.created_on
ELSE NULL
END <> f.pta_conversion_date_c) d