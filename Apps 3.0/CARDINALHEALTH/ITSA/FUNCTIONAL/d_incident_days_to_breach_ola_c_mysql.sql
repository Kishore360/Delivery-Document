SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from cardinalhealth_mdwdb.d_incident si 
JOIN cardinalhealth_mdwdb.f_task_sla id ON 
	 id.incident_key=si.row_key  
where id.actual_time_left_c<>si.days_to_breach_ola_c)c