
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_configuration_item.cpu_core_count_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_configuration_item trgt
right JOIN bbandt_mdsdb.cmdb_ci_server_final ser 
ON trgt.row_id = ser.sys_id AND trgt.source_id = ser.sourceinstance
WHERE trgt.soft_deleted_flag='N' and  trgt.cpu_core_count_c<> coalesce(ser.cpu_core_count,'0')
;
