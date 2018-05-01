SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from tjx_mdsdb.cmdb_ci_final SRC 
join tjx_mdwdb.d_configuration_item TRGT on
SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where SRC.category<>TRGT.category)a ;

