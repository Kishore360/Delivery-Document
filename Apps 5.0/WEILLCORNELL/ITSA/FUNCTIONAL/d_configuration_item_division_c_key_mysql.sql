SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select etl.division_c_key , 
COALESCE(CASE WHEN COALESCE(CONCAT('DIVISION~',src.u_division),'UNSPECIFIED') = 'UNSPECIFIED' THEN 0 ELSE lkp.row_key END,-1) from
weillcornell_mdsdb.cmdb_ci_final src 
left join weillcornell_workdb.d_internal_organization lkp ON lkp.row_id = CONCAT('DIVISION~',src.u_division)
 AND lkp.source_id = src.sourceinstance
 left join weillcornell_mdwdb.d_configuration_item etl 
 on src.sys_id = etl.row_id and src.sourceinstance = etl.source_id 
 where  etl.division_c_key <> COALESCE(CASE WHEN COALESCE(CONCAT('DIVISION~',src.u_division),'UNSPECIFIED') = 'UNSPECIFIED' THEN 0 ELSE lkp.row_key END,-1)
)a
 