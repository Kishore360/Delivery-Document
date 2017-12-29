SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_cat_item_delivery_task_c.short_description' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.sc_cat_item_delivery_task_final SRC 
 LEFT JOIN qualcomm_mdwdb.d_cat_item_delivery_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE SRC.short_description <> TRGT.short_description;

