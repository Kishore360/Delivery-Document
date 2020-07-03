

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_configuration_item.cpu_count_c' ELSE 'SUCCESS' END as Message 
 FROM truist_mdsdb.cmdb_ci_server_final ser 
left join  truist_mdwdb.d_configuration_item trgt  
on ser.sys_id=trgt.row_id and ser.sourceinstance=trgt.source_id
WHERE   ser.cpu_count<>trgt.cpu_count_c 
and ser.cdctype='X'
;
