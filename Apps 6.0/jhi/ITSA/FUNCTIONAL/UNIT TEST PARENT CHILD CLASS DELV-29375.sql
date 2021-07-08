SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_cmdb_ci_rel_c.class' ELSE 'SUCCESS' END as Message
FROM jhi_mdsdb.cmdb_ci_final SRC1
JOIN jhi_mdsdb.sys_db_object_final SRC2 ON
SRC2.name=SRC1.sys_class_name
JOIN jhi_mdwdb.d_configuration_item TRGT ON
SRC1.sys_id = TRGT.row_id and SRC1.sourceinstance = TRGT.source_id
WHERE  SRC2.label <> (TRGT.class) and TRGT.soft_deleted_flag ='N';