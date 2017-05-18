SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from uclahealth_mdwdb.d_internal_organization dfi
join uclahealth_mdsdb.sys_user_group_final incf
on dfi.row_id = concat('GROUP~',incf.sys_id) and dfi.source_id= incf.sourceinstance
where  dfi.it_organization_c <> u_it_org )a;




