SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_v_app_to_server_to_product_confirmed_c.webserver_product' ELSE 'SUCCESS' END as Message
 FROM bbandt_mdsdb.v_app_to_server_to_product_confirmed_final src 
 join bbandt_mdwdb.d_v_app_to_server_to_product_confirmed_c trgt
  ON  CONCAT('APPID-',src.app_id)=trgt.app_id 
  and trgt.source_id = src.sourceinstance
 WHERE COALESCE(src.webserver_product,'UNSPECIFIED') <> trgt.webserver_product
 and src.cdctype='X';