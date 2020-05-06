SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_v_server_to_product_c.webserver_product' ELSE 'SUCCESS' END as Message
 -- select COALESCE(src.webserver_product,'UNSPECIFIED'), trgt.webserver_product
 FROM bbandt_mdsdb.v_server_to_product_final src 
 join bbandt_mdwdb.d_v_server_to_product_c trgt
  ON   CONCAT(src.name,'~', src.sys_class_name, '~', src.operational_status, '~',src.webserver_product)=trgt.row_id 
  and trgt.source_id = src.sourceinstance
 WHERE COALESCE(src.webserver_product,'UNSPECIFIED') <> trgt.webserver_product
 and src.cdctype='X';
 

 
