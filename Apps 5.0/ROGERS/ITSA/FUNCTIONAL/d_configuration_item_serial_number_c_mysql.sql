SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message from (
select count(1) cnt
        FROM
     rogers_mdwdb.d_configuration_item d 
JOIN rogers_mdsdb.cmdb_ci_final p ON d.row_id=sys_id 
where serial_number_c <> COALESCE(p.serial_number,'UNSPECIFIED') 
)a