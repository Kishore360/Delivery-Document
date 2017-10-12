
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.priority_src_key' ELSE 'SUCCESS' END as Message
 FROM  qualcomm_mdsdb.sc_task_final SRC 
  JOIN     qualcomm_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 join qualcomm_mdwdb.d_cat_item_delivery_task_c lkp
 on COALESCE(SRC.delivery_task,'UNSPECIFIED')=lkp.row_id
where  
            coleasce(lkp.row_key,case when SRC.delivery_task is null then 0 else -1 end ) <>(TRGT.cat_item_delivery_task_key )
			
			
			
			
			