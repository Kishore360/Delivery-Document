
SELECT CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_configuration_item.ip_address_c' ELSE 'SUCCESS' END as Message 
FROM (SELECT  
count(1) as cnt
FROM bbandt_mdwdb.d_configuration_item trgt
right JOIN bbandt_mdsdb.cmdb_ci_final ser 
ON trgt.row_id = ser.sys_id AND trgt.source_id = ser.sourceinstance
WHERE coalesce(trgt.ip_address_c,'0') <> coalesce(ser.ip_address,'0')
and ser.CDCTYPE<>'D' and trgt.soft_deleted_flag='N'
) a
;