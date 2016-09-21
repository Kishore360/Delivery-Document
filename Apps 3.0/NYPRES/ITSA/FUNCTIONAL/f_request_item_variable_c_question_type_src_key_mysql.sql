SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item_variable_c.question_type_src_key' ELSE 'SUCCESS' END as Message
FROM 
	nypres_mdsdb.item_option_new_final SRC

LEFT JOIN 
	nypres_mdwdb.f_request_item_variable_c TRGT 
	ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN 
	nypres_mdwdb.d_lov LKP 
	ON (concat('TYPE~QUESTION~~~',SRC.type) =LKP.row_id 
	AND SRC.sourceinstance= LKP.source_id  )
WHERE  COALESCE(LKP.row_key,CASE WHEN SRC.type IS NULL THEN 0 else -1 end) <> TRGT.question_type_src_key


