SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.mf_online_inst_db2_module_src_code_c' ELSE 'SUCCESS' END as Message 
FROM fidelity_mdsdb.change_request_final  SRC 
JOIN fidelity_mdwdb.f_change_request TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
 WHERE SRC.u_reason_for_change <> (TRGT.reason_src_code) 
