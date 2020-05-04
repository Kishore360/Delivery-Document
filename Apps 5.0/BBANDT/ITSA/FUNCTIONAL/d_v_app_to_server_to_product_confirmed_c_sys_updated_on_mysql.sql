SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_v_app_to_server_to_product_confirmed_c.sys_updated_on' ELSE 'SUCCESS' END as Message
 FROM bbandt_mdsdb.v_app_to_server_to_product_confirmed_final src 
 join bbandt_mdwdb.d_v_app_to_server_to_product_confirmed_c trgt
  ON  CONCAT('APPID-',src.app_id)=trgt.app_id 
  and trgt.source_id = src.sourceinstance
 WHERE COALESCE(CONVERT_TZ (src.sys_updated_on,'GMT','America/New_York'),'UNSPECIFIED') <> trgt.sys_updated_on
 and src.cdctype='X';