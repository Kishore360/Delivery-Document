SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt from pgi_mdwdb.d_task_sla a
join pgi_mdwdb.contract_sla_final b on a.row_id=b.sys_id and a.source_id=b.sourceinstance
where (a.sla_category<> 'resolution' and lower(b.name) like '%resolved%') OR
		(a.sla_category <>'RESTORATION' and b.stop_condition ='u_service_restored=true^EQ')

)c;
 