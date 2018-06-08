SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for d_change_request.sub_status_src_c_key' ELSE 'SUCCESS' END as Message 
 FROM rogersdev_mdsdb.fm_expense_line_final  SRC 
left JOIN rogersdev_mdwdb.d_expense_item TRGT 
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id  
  WHERE coalesce(src.short_description,'UNSPECIFIED')<> (TRGT.short_desc) 


