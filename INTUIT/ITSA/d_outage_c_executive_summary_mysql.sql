SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from intuit_mdsdb.cmdb_ci_outage_final i 
left join intuit_mdsdb.incident_final inf ON i.task_number=inf.sys_id
left join intuit_mdwdb.d_outage_c t on t.row_id=i.sys_id and t.source_id=i.sourceinstance
where t.executive_summary<>inf.u_executive_summary )b
