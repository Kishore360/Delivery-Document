SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(*) as cnt from incomm_mdwdb.d_incident a JOIN incomm_mdsdb.incident_final   b ON (a.row_id collate utf8_general_ci=b.sys_id) and exclude_flag <> 'Y' and b.u_spam=1
)c