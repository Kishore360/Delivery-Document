SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_variable_c.question_text' ELSE 'SUCCESS' END as Message
-- SELECT coalesce(SRC.question_text,'UNSPECIFIED'),TRGT.question_text 
FROM  nypres_mdsdb.item_option_new_final SRC
 JOIN 
	nypres_mdwdb.d_variable_c TRGT 
	ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id  )
WHERE  coalesce(SRC.question_text,'UNSPECIFIED') <> TRGT.question_text
and TRGT.soft_deleted_flag='N';
