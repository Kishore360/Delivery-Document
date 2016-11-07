SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(*) as cnt from rei_mdwdb.d_configuration_item a 
inner join rei_mdsdb.cmdb_ci_final
b on a.row_id =b.sys_id and a.source_id=b.sourceinstance
left join rei_mdsdb.sys_user_final c on b.u_support_manager =c.sys_id and b.Sourceinstance=c.Sourceinstance
where
CONCAT_WS(' ',c.first_name, c.last_name)<>a.supported_by )a 