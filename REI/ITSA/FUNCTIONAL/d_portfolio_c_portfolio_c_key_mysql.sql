SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message

from rei_mdsdb.pm_project_final s
left join rei_mdwdb.d_portfolio_c l
on s.pm_portfolio=l.row_id and s.sourceinstance=l.source_id  
left join rei_mdwdb.d_project t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
where  l.row_key=t.portfolio_c_key);
