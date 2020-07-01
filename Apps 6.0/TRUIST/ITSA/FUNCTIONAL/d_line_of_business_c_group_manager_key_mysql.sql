

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_line_of_business_c.group_manager_key' ELSE 'SUCCESS' END as Message
 FROM
 truist_mdsdb.u_cmdb_etc_bus_unit_final src 
 join  truist_mdwdb.d_line_of_business_c trgt
  ON trgt.row_id = src.sys_id and trgt.source_id = src.sourceinstance
  join  truist_mdwdb.d_internal_contact lkp
  on lkp.row_id=COALESCE(CONCAT('INTERNAL_CONTACT~',src.u_group_manager),'UNSPECIFIED') and src.sourceinstance=lkp.source_id
  WHERE COALESCE(lkp.row_key,case when src.u_group_manager is null then 0 else -1 end) <> trgt.group_manager_key
  
  
 
 
 
 
 
 
 
 

 
 

 
 

 
 