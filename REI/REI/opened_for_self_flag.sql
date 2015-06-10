SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt from rei_workdb.d_incident AA
INNER JOIN rei_mdsdb.incident_final BB ON AA.row_id =BB.sys_id AND AA.source_id=BB.sourceinstance
where
opened_for_self_flag <> case when BB.u_self_service_incident = 1 then 'Y' else 'N' end)c