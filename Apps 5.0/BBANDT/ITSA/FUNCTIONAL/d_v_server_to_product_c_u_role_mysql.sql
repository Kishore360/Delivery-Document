SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_v_server_to_product_c.u_role' ELSE 'SUCCESS' END as Message
 -- select COALESCE(src.u_role,'UNSPECIFIED'), trgt.u_role
 FROM bbandt_mdsdb.v_server_to_product_final src 
 join bbandt_mdwdb.d_v_server_to_product_c trgt
  ON   CONCAT(src.name,'~', src.sys_class_name, '~', src.operational_status, '~',src.u_role)=trgt.row_id 
  and trgt.source_id = src.sourceinstance
 WHERE COALESCE(src.u_role,'UNSPECIFIED') <> trgt.u_role
 and src.cdctype='X';
 

 
