
SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_configuration_item.db_version_c' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
 wpl_mdwdb.d_configuration_item a
 LEFT join  wpl_mdsdb.cmdb_ci_db_mssql_instance_final mssql
on a.row_id=mssql.sys_id and a.source_id=mssql.sourceinstance
LEFT join  wpl_mdsdb.cmdb_ci_db_db2_instance_final db2
on a.row_id=db2.sys_id and a.source_id=db2.sourceinstance
LEFT join  wpl_mdsdb.cmdb_ci_db_ora_instance_final ora
on a.row_id=ora.sys_id and a.source_id=ora.sourceinstance
LEFT join  wpl_mdsdb.u_cmdb_ci_appl_sap_instance_final sap
on a.row_id=sap.sys_id and a.source_id=sap.sourceinstance
 where COALESCE(mssql.version,db2.version,ora.version,sap.version,'UNSPECIFIED') <>a.db_version_c
and a.soft_deleted_flag='N' )ma
 