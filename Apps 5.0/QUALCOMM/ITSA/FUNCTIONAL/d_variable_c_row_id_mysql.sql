SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_variable_c.row_id' ELSE 'SUCCESS' END as Message
FROM 
	qualcomm_mdsdb.item_option_new_final SRC
JOIN 
	qualcomm_mdwdb.d_variable_c TRGT 
	ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id  )
WHERE  SRC.sys_id <> TRGT.row_id
