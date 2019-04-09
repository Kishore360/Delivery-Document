SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.NAME' ELSE 'SUCCESS' END as Message 
FROM (
select count(1) as CNT from nbcu_mdsdb.cmdb_ci_final SRC
LEFT JOIN nbcu_mdwdb.d_configuration_item TRGT
ON (SRC.sys_id= TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
where coalesce(SRC.name,'UNSPECIFIED')<>TRGT.NAME and TRGT.soft_deleted_flag='N')temp;
