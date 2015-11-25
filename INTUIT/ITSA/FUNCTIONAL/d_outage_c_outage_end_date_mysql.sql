SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from intuit_mdsdb.cmdb_ci_outage_final i
LEFT JOIN intuit_mdsdb.incident_final inf ON i.task_number=inf.sys_id
left join intuit_mdwdb.d_outage_c t
on i.sys_id=t.row_id and i.sourceinstance = t.source_id
WHERE t.outage_end_date <> CONVERT_TZ(i.END,'GMT' ,'America/Los_Angeles')) temp 
