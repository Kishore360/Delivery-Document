SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt FROM uclahealth_mdsdb.incident_final a
left JOIN  
uclahealth_mdwdb.d_incident B
on a.u_reprioritization_count=B.reprioritization_count_c
left join
uclahealth_mdwdb.f_incident c on B.row_key=c.incident_key
WHERE B.row_key<>c.reprioritization_count_c)E;

