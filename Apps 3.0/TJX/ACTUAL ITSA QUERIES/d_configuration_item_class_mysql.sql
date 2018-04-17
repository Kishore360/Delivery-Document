SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from tjx_mdsdb.cmdb_ci_final SRC 
left join  tjx_mdsdb.sys_db_object_final sysdb
on SRC.sys_class_name=sysdb.name and SRC.sourceinstance=sysdb.sourceinstance
join tjx_mdwdb.d_configuration_item TRGT on
SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where sysdb.label<>TRGT.class)a ;


