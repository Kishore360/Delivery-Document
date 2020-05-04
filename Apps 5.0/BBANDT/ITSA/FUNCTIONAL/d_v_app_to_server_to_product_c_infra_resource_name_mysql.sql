SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_v_app_to_server_to_product_c.infra_resource_name' ELSE 'SUCCESS' END as Message
 FROM bbandt_mdsdb.v_app_to_server_to_product_final src 
 join bbandt_mdwdb.d_v_app_to_server_to_product_c trgt
  ON CONCAT(src.app_id, '~',src.app_name, '~', src.infra_resource_name,'~',src.source)=trgt.row_id 
  and trgt.source_id = src.sourceinstance
 WHERE COALESCE(src.infra_resource_name,'UNSPECIFIED') <> trgt.infra_resource_name
 and src.cdctype='X';
 