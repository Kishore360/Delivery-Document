SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.case_cause_code_src_c_key' ELSE 'SUCCESS' END as Message
FROM ibmwatson_mdsdb.sn_customerservice_case_final SRC 
LEFT JOIN ibmwatson_mdwdb.f_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN ibmwatson_mdwdb.d_lov LKP 
	ON ( coalesce(concat('CAUSE_CODE_C~CASE~',SRC.u_cause_code),'UNSPECIFIED') = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_cause_code IS NULL THEN 0 else '-1' end)<> TRGT.case_cause_code_c_key 


