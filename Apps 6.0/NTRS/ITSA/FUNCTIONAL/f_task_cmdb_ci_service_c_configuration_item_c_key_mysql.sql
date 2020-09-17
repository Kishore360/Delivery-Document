



SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_task_cmdb_ci_service_c.configuration_item_c_key' ELSE 'SUCCESS' END as Message
FROM 
(Select count(1) CNT
FROM  ntrust_mdsdb.task_cmdb_ci_service_final SRC
LEFT JOIN ntrust_mdwdb.f_task_cmdb_ci_service_c TRGT2 ON (SRC.sys_id=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
 JOIN ntrust_mdwdb.d_service LKP ON  coalesce(SRC.cmdb_ci_service,
                'UNSPECIFIED')=LKP.row_id  AND SRC.sourceinstance=LKP.source_id
where case when SRC.cmdb_ci_service is NULL then 0 else coalesce(LKP.row_key,-1) end <> TRGT2.configuration_item_c_key and SRC.cdctype='X') temp;
 
 





		
		
		
		