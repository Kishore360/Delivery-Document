SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt FROM uclahealth_mdsdb.incident_final a

join
uclahealth_mdwdb.f_incident c on a.sys_id=c.row_id  and a.sourceinstance=c.source_id
WHERE a.u_reprioritization_count<>c.reprioritization_count_c)E;