

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1)  
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.d_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_o_data_freshness fresh
on fresh.etl_run_number = t.etl_run_number and fresh.source_id = t.source_id
where case when active= 1 and due_date < fresh.lastupdated then 'Y' else 'N' end <> over_due_flag) ;
