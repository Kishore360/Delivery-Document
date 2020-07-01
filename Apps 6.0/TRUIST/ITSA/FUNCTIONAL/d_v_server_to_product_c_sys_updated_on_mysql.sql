SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_v_server_to_product_c.sys_updated_on' ELSE 'SUCCESS' END as Message
 -- select COALESCE(src.sys_updated_on,'UNSPECIFIED'), trgt.sys_updated_on
 FROM truist_mdsdb.v_server_to_product_final src 
 join truist_mdwdb.d_v_server_to_product_c trgt
  ON   CONCAT(src.name,'~', src.sys_class_name, '~', src.operational_status, '~',src.webserver_product)=trgt.row_id 
  and trgt.source_id = src.sourceinstance
 WHERE CONVERT_TZ (src.sys_updated_on,'GMT','America/Los_Angeles') <> trgt.sys_updated_on
 and src.cdctype='X';
 
 /*Mismatch for 1 record*/

 
