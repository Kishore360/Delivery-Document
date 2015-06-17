SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt from
rei_mdwdb.d_project A
JOIN rei_mdsdb.pm_project_final B
ON A.row_id = B.sys_id
JOIN rei_mdsdb.pm_portfolio_final C
ON C.sys_id = B.pm_portfolio
JOIN rei_mdsdb.sys_user_final D
ON C.u_portfolio_owner = D.sys_id
and  portfolio_owner <> COALESCE(Concat(D.first_name,' ',D.last_name),'UNSPECIFIED'))c;