SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(*) as cnt from rei_mdwdb.d_configuration_item a 
inner join rei_mdsdb.cmdb_ci_final
b on a.row_id =b.sys_id and a.source_id=b.sourceinstance
left join rei_mdsdb.sys_user_final d on b.u_director=d.sys_id and b.Sourceinstance=d.Sourceinstance
where
CONCAT_WS(' ',d.first_name, d.last_name)<>a.managed_by )a 