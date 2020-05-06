SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_sa_app_to_infrastructure_export_c.tbl_export_dt' ELSE 'SUCCESS' END as Message
 FROM bbandt_mdsdb.sa_app_to_infrastructure_export_final src 
 join bbandt_mdwdb.d_sa_app_to_infrastructure_export_c trgt
  ON trgt.row_id = CONCAT(src.app_id, src.infra_resource_name,src.infra_resource_type, src.source,src.ifv_dbid) 
  and trgt.source_id = src.sourceinstance
 WHERE  coalesce(src.tbl_export_dt,'UNSPECIFIED') <> trgt.tbl_export_dt
 and src.cdctype='X';