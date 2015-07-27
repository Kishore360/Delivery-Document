SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from pgi_mdwdb.f_problem dfi
join pgi_mdsdb.problem_final incf on
dfi.row_id = incf.sys_id
where
dfi.state_src_code <> incf.problem_state)c;