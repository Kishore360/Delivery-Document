SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from jnj_mdwdb.f_incident a11
join jnj_mdwdb.d_incident a12 on a11.incident_key = a12.row_key
join (select task,timestampdiff(second,'1970-01-01 00:00:00',business_duration) as res,max(planned_end_time)from jnj_mdsdb.task_sla_final a13
join (select * from jnj_mdsdb.contract_sla_final where lower(name) like '%resolution%') a14 
on a13.sla = a14.sys_id and a13.sourceinstance= a14.sourceinstance
group by 1) SRC on a12.row_id = SRC.task and a12.source_id = 2
where a11.business_duration_c <> SRC.res
)E;
