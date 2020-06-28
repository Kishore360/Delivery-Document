SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_line_of_business_c.name' ELSE 'SUCCESS' END as Message
 FROM bbandt_mdsdb.u_cmdb_etc_bus_unit_final src 
 join bbandt_mdwdb.d_line_of_business_c trgt
  ON trgt.row_id = src.sys_id and trgt.source_id = src.sourceinstance
 WHERE COALESCE(src.u_unit,'UNSPECIFIED') <> trgt.name;
