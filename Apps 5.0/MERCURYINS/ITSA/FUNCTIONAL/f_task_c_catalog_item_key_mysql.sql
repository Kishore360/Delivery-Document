SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercuryins_mdsdb.task_final SRC
join mercuryins_mdsdb.sc_req_item_final SRC1 
on SRC1.sys_id=SRC.sys_id and SRC1.sourceinstance=SRC.sourceinstance  
JOIN mercuryins_mdwdb.f_task_c TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )
join mercuryins_mdwdb.d_master_item LKP
on SRC1.cat_item=LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC1.cat_item is null then  0 else -1 end )<>TRGT.catalog_item_key
