SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) > 0 THEN 'MDS to DWH data validation failed for d_request_item.response_sla_c_flag' ELSE 'SUCCESS' END as Message 
FROM (
SELECT trgt.row_id,src.*,trgt.used_for_flag_c,trgt.soft_deleted_flag
FROM pandg_mdwdb.d_configuration_item trgt
RIGHT JOIN 
(SELECT a11.sys_id,a11.sourceinstance,a11.sys_class_name,a11.u_pg_environment,a12.used_for us1,a13.used_for us2,a14.used_for us3,a15.used_for us4
,CASE WHEN (a11.sys_class_name NOT IN ('cmdb_ci_appl','cmdb_ci_db_instance','cmdb_ci_service','service_offering') OR a11.sys_class_name IS NULL )
 AND COALESCE(a11.u_pg_environment,'UNSPECIFIED') <>'Production' THEN 'Y' 
WHEN a11.sys_class_name ='cmdb_ci_appl' AND COALESCE(a12.used_for,'UNSPECIFIED') <> 'Production' THEN 'Y'
WHEN a11.sys_class_name ='cmdb_ci_db_instance' AND COALESCE(a13.used_for,'UNSPECIFIED') <> 'Production' THEN 'Y'
WHEN a11.sys_class_name ='cmdb_ci_service' AND COALESCE(a14.used_for,'UNSPECIFIED') <> 'Production' THEN 'Y'
WHEN a11.sys_class_name ='service_offering' AND COALESCE(a15.used_for,'UNSPECIFIED') <> 'Production' THEN 'Y'
ELSE 'N' END vl_to_check
FROM pandg_mdsdb.cmdb_ci_final a11
LEFT JOIN pandg_mdsdb.cmdb_ci_appl_final a12 ON a11.sys_id = a12.sys_id AND a11.sourceinstance = a12.sourceinstance
LEFT JOIN pandg_mdsdb.cmdb_ci_db_instance_final a13 ON a11.sys_id = a13.sys_id AND a11.sourceinstance = a13.sourceinstance
LEFT JOIN pandg_mdsdb.cmdb_ci_service_final a14 ON a11.sys_id = a14.sys_id AND a11.sourceinstance = a14.sourceinstance
LEFT JOIN pandg_mdsdb.service_offering_final a15 ON a11.sys_id = a15.sys_id AND a11.sourceinstance = a15.sourceinstance
) src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE trgt.used_for_flag_c <> src.vl_to_check
AND trgt.soft_deleted_flag ='N'
)temp
;
