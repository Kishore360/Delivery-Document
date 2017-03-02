SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt 
from
rei_mdwdb.d_project TGT
JOIN rei_mdsdb.pm_project_final SRC
on TGT.row_id = SRC.sys_id AND TGT.source_id = SRC.sourceinstance
LEFT JOIN rei_mdwdb.d_portfolio_c lkp
ON COALESCE(primary_portfolio, 'UNSPECIFIED')=lkp.row_id
where  TGT.portfolio_key <> COALESCE(lkp.row_key,case when SRC.primary_portfolio is null then 0 else -1 end ) )c