SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(*) as cnt from rei_workdb.dwh_d_configuration_item a inner join rei_mdsdb.cmdb_ci_final
b on a.row_id collate utf8_general_ci=b.sys_id and a.source_id=b.sourceinstance
left join rei_mdsdb.sys_user_final c on b.u_support_manager =c.sys_id and b.Sourceinstance=c.Sourceinstance
left join rei_mdsdb.sys_user_final d on b.u_director=d.sys_id and b.Sourceinstance=d.Sourceinstance
where
a.supported_by collate utf8_general_ci <> CONCAT_WS(' ',c.first_name, c.last_name) or
a.managed_by collate utf8_general_ci <> CONCAT_WS(' ',d.first_name, d.last_name))c;

