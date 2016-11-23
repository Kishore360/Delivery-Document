SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM 
(select count(1) as cnt from 
intuit_mdsdb.u_service_delivery_team_l4s_final
join intuit_mdwdb.d_service_delivery_team_l4s_c on sys_id=row_id and sourceinstance=source_id
where u_name<>name)a