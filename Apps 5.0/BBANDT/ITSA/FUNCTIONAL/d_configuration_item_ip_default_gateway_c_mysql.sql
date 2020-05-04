SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_configuration_item.ip_default_gateway_c' ELSE 'SUCCESS' END as Message 
FROM (SELECT  count(1) as cnt from 
bbandt_mdwdb.d_configuration_item trgt
right JOIN bbandt_mdsdb.cmdb_ci_server_final ser 
ON trgt.row_id = ser.sys_id AND trgt.source_id = ser.sourceinstance
WHERE ser.u_ip_default_gateway <> trgt.ip_default_gateway_c
and ser.CDCTYPE='X' and trgt.soft_deleted_flag='N')a;