

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
  FROM 
 ibmwatson_mdsdb.change_request_final src
  join ibmwatson_mdwdb.d_change_request trgt 
 on src.sys_id = trgt.row_id 
 and src.sourceinstance = trgt.source_id and src.cdctype<>'D'
 left join ibmwatson_mdwdb.d_task lkup 
 on src.parent = lkup.row_id
 and src.sourceinstance = lkup.source_id  
 where  trgt.change_request_parent_c_key <>COALESCE(lkup.row_key,CASE WHEN src.parent IS NULL THEN 0 else -1 end)
 
 
 