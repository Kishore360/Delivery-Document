
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_configuration_item.cpu_type_c' ELSE 'SUCCESS' END as Message 
FROM (SELECT  
trgt.row_id,ser.sys_id,
coalesce(trgt.cpu_type_c,'0') , coalesce(ser.cpu_type,'0')
FROM bbandt_mdwdb.d_configuration_item trgt
right JOIN bbandt_mdsdb.cmdb_ci_server_final ser 
ON trgt.row_id = ser.sys_id AND trgt.source_id = ser.sourceinstance
WHERE coalesce((trgt.cpu_type_c),'0') <> coalesce(ser.cpu_type,'0')

) a
;

