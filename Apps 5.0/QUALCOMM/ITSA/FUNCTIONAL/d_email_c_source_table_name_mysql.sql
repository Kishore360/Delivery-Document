
			SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_email_c.source_table_name

' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.sys_email_final SRC 
LEFT JOIN qualcomm_mdwdb.d_email_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE SRC.target_table <> TRGT.source_table_name;

