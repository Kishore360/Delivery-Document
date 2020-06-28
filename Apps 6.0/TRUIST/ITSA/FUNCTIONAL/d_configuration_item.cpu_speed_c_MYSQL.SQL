SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_configuration_item.cpu_speed_c' ELSE 'SUCCESS' END as Message 
FROM (SELECT  count(1) as cnt from 
truist_mdwdb.d_configuration_item trgt
right JOIN truist_mdsdb.cmdb_ci_server_final ser 
ON trgt.row_id = ser.sys_id AND trgt.source_id = ser.sourceinstance
WHERE truncate(trgt.cpu_speed_c,2) <> coalesce(ser.cpu_speed,'0')
and ser.CDCTYPE<>'D' and trgt.soft_deleted_flag='N')a;