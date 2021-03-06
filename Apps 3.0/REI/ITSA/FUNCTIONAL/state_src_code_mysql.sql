SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(*) as cnt from rei_mdwdb.f_problem AA INNER JOIN rei_mdsdb.problem_final BB
ON AA.row_id =BB.sys_id AND AA.source_id=BB.sourceinstance
where state_src_code<> BB.state)c