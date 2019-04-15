SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_configuration_item.serial_number_c' ELSE 'SUCCESS' END as Message 
FROM 
(select count(1) as cnt  from aetna_mdsdb.cmdb_ci_final  src
left join aetna_mdwdb.d_configuration_item trgt on src.sys_id=trgt.row_id and src.sourceinstance = trgt.source_id
where COALESCE(src.serial_number,'UNSPECIFIED') <> trgt.serial_number_c and src.cdctype<>'D')ma;