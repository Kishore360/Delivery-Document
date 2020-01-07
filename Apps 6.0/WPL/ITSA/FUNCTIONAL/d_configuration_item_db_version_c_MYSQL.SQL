SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_configuration_item.db_version_c' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) cnt       
        FROM
            wpl_mdsdb.cmdb_ci_final cmdb_ci 
         left join wpl_mdwdb.d_configuration_item trg on cmdb_ci.sys_id =trg.row_id and cmdb_ci.sourceinstance=trg.source_id			
        LEFT OUTER JOIN
            wpl_mdsdb.cmdb_ci_db_mssql_instance_final cmdb_ci_db_mssql_instance 
                ON cmdb_ci.sys_id=cmdb_ci_db_mssql_instance.sys_id 
                and cmdb_ci.sourceinstance=cmdb_ci_db_mssql_instance.sourceinstance 
        LEFT OUTER JOIN
            wpl_mdsdb.cmdb_ci_db_db2_instance_final cmdb_ci_db_db2_instance 
                ON cmdb_ci.sys_id=cmdb_ci_db_db2_instance.sys_id 
                and cmdb_ci.sourceinstance=cmdb_ci_db_db2_instance.sourceinstance 
        LEFT OUTER JOIN
            wpl_mdsdb.cmdb_ci_db_ora_instance_final cmdb_ci_db_ora_instance 
                ON cmdb_ci.sys_id=cmdb_ci_db_ora_instance.sys_id 
                and cmdb_ci.sourceinstance =cmdb_ci_db_ora_instance.sourceinstance 
        LEFT OUTER JOIN
            wpl_mdsdb.u_cmdb_ci_appl_sap_instance_final u_cmdb_ci_appl_sap_instance 
                ON cmdb_ci.sys_id=u_cmdb_ci_appl_sap_instance.sys_id 
                and cmdb_ci.sourceinstance=u_cmdb_ci_appl_sap_instance.sourceinstance 
                
                where COALESCE(cmdb_ci_db_mssql_instance.version,
            cmdb_ci_db_db2_instance.version,
            cmdb_ci_db_ora_instance.version,
            u_cmdb_ci_appl_sap_instance.version,
            'UNSPECIFIED') <> trg.db_version_c and cmdb_ci.cdctype<>'D'
            )ma
 