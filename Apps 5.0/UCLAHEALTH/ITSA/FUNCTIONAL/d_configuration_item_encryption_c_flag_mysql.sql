SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from uclahealth_mdwdb.d_configuration_item dfi
join uclahealth_mdsdb.cmdb_ci_final incf
on dfi.row_id = incf.sys_id and dfi.source_id= incf.sourceinstance
where  dfi.encryption_c_flag <> case when u_encryption='Yes' then 'Y'else 'N' end )a



