SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_configuration_item.disk_space_c' ELSE 'SUCCESS' END as Message 
FROM (SELECT  count(1) as cnt from 
truist_mdwdb.d_configuration_item trgt
right JOIN truist_mdsdb.cmdb_ci_server_final ser 
ON trgt.row_id = ser.sys_id AND trgt.source_id = ser.sourceinstance
WHERE ser.disk_space <> trgt.disk_space_c
and ser.CDCTYPE='X' and trgt.soft_deleted_flag='N')a;