SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(*) as cnt from rei_mdwdb.d_incident AA
inner join rei_mdsdb.incident_final BB ON AA.row_id  =BB.sys_id AND AA.source_id=BB.sourceinstance
where reopened_flag <> CASE WHEN BB.u_original_resolution_date<>BB.u_last_resolution_date then 'Y' else 'N' end)c;
 