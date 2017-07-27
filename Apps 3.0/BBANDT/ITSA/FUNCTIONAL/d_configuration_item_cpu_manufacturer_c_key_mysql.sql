

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_configuration_item.cpu_manufacturer_c_key' ELSE 'SUCCESS' END as Message 
FROM (
SELECT   trgt.row_id,ser.sys_id,COALESCE(lkp.row_key,CASE WHEN ser.cpu_manufacturer IS NULL THEN 0 else -1 end) ,cpu_manufacturer_c_key
-- count(1)
 FROM bbandt_mdwdb.d_configuration_item trgt
-- RIGHT JOIN bbandt_mdsdb.cmdb_ci_final src on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN bbandt_mdsdb.cmdb_ci_server_final ser 
ON trgt.row_id = ser.sys_id AND trgt.source_id = ser.sourceinstance
LEFT JOIN bbandt_mdwdb.d_internal_organization lkp
ON COALESCE(CONCAT('SUBSIDIARY~',ser.cpu_manufacturer),'UNSPECIFIED') = lkp.row_id and ser.sourceinstance = lkp.source_id
WHERE COALESCE(lkp.row_key,CASE WHEN ser.cpu_manufacturer IS NULL THEN 0 else -1 end) <> cpu_manufacturer_c_key
)a
;
