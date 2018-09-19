SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.mf_online_inst_db2_module_src_code_c' ELSE 'SUCCESS' END as Message 
FROM fidelity_mdsdb.cmdb_ci_appl_final  SRC 
JOIN fidelity_mdwdb.d_application TRGT 
ON (CONCAT('APPLICATION~',SRC.sys_id) = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
join fidelity_mdwdb.d_fmr_product_c LKP
on COALESCE(SRC.u_product,'UNSPECIFIED') = LKP.row_id and SRC.sourceinstance=LKP.source_id
 WHERE  COALESCE(LKP.row_key,case when SRC.u_product is null then 0 else -1 end ) <> TRGT.fmr_product_c_key; 