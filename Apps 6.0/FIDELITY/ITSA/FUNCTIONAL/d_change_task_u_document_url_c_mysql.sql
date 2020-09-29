SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_task.u_document_url_c' ELSE 'SUCCESS' END as Message
 FROM fidelity_mdsdb.change_task_final SRC 
 LEFT JOIN fidelity_mdwdb.d_change_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id and TRGT.soft_deleted_flag = 'N' )
 WHERE SRC.u_documentation_url<> COALESCE(TRGT.u_document_url_c);