SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.mf_online_inst_db2_module_src_code_c' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdsdb.change_request_final  SRC 
JOIN mcdonalds_mdwdb.f_change_request_failure_adv_c TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
 WHERE SRC.u_reason <> (TRGT.reason_src_code) 

 
 