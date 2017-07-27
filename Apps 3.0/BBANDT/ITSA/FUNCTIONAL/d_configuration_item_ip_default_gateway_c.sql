
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_configuration_item.subnet_mask_c' ELSE 'SUCCESS' END as Message 
FROM (SELECT  
trgt.row_id,ser.sys_id,
coalesce(trgt.subnet_mask_c,'0') , coalesce(ser.u_subnet_mask,'0')
FROM bbandt_mdwdb.d_configuration_item trgt
LEFT JOIN bbandt_mdsdb.cmdb_ci_final ser 
ON trgt.row_id = ser.sys_id AND trgt.source_id = ser.sourceinstance
WHERE coalesce(trgt.subnet_mask_c,'0') <> coalesce(ser.u_subnet_mask,'0');

) a
;