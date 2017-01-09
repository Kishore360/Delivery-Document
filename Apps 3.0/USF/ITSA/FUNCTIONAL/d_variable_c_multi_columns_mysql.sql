SELECT  
 CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END as Message
FROM 
  usf_mdsdb.item_option_new_final SRC
 JOIN 
	usf_mdwdb.d_variable_c TRGT 
	ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id  )
WHERE  SRC.question_text <> TRGT.question_text or 
SRC.name<>TRGT.name or
 SRC.sys_class_name<>TRGT.variable_class or
 SRC.reference<>TRGT.reference or 
SRC.choice_table<>TRGT.choice_table or 
SRC.choice_field<>TRGT.choice_column 



