SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt from rei_mdwdb.d_project a join rei_mdsdb.pm_project_final b
on a.row_id=b.sys_id and a.source_id=b.sourceinstance
join rei_mdsdb.pm_portfolio_final c on (c.sys_id=b.pm_portfolio) 
and a.portfolio_name <>COALESCE(c.name,'UNSPECIFIED'))c;