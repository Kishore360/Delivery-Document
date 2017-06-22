SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_incident.opened_on' ELSE 'SUCCESS' END as Message from (select count(1) cnt  
 FROM  svb_mdsdb.sc_task_final SRC
 JOIN svb_mdwdb.d_request_task TRGT  
 ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
 WHERE CASE WHEN SRC.u_is_form_pre_prod = 1 THEN  'Y' ELSE 'N' END<> TRGT.is_form_pre_prod_c )b


