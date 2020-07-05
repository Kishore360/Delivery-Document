SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.soft_layer_subject_src_c_key' ELSE 'SUCCESS' END as Message
FROM ibmwatson_mdsdb.sn_customerservice_case_final SRC 
JOIN ibmwatson_mdwdb.d_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN ibmwatson_mdwdb.d_lov LKP 
	ON ( coalesce(concat('SOFTLAYER_SUBJECT_C~CASE~',SRC.u_softlayer_subject),'UNSPECIFIED') = LKP.row_id
	)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_softlayer_subject IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.case_soft_layer_subject_c_key ,'')





