SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_call.sys_class_name_c' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.new_call_final SRC 
 LEFT JOIN qualcomm_mdwdb.d_call TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE SRC.sys_class_name <> (TRGT.sys_class_name_c);

