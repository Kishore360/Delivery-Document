SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.row_id' ELSE 'SUCCESS' END as Message
FROM 
(Select count(1) CNT
FROM ntrust_mdsdb.cmdb_ci_final SRC
left join  ntrust_mdwdb.d_configuration_item c on SRC.sys_id=c.row_id and SRC.sourceinstance=c.source_id
where SRC.sys_id<>c.row_id and SRC.cdctype<>'D')temp
