
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from jnj_mdwdb.d_incident a11
join jnj_mdsdb.incident_final a12 on a11.row_id = a12.sys_id and a11.source_id= a12.sourceinstance
WHERE 
a11.major_incident_flag <> CASE WHEN a12.priority=1 OR u_reliability =1 OR severity=1 THEN 'Y' ELSE 'N' END
)E;