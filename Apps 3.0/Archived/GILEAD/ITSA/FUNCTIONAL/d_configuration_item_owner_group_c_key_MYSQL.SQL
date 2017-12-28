

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_configuration_item.owner_group_c_key' ELSE 'SUCCESS' END as Message
FROM 
(SELECT count(1) as CNT
FROM gilead_mdsdb.cmdb_ci_final SRC
JOIN gilead_mdwdb.d_configuration_item TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
JOIN gilead_mdwdb.d_internal_organization LKP 
ON (COALESCE(CONCAT('GROUP~',SRC.support_group),'UNSPECIFIED')= LKP.row_id
AND SRC.sourceinstance= LKP.source_id)
WHERE COALESCE (LKP.row_key,CASE WHEN SRC.support_group IS NULl THEN 0 ELSE -1 END) <> (TRGT.owner_group_c_key))temp;