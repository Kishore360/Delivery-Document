SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.third_party_status_src_c_key' ELSE 'SUCCESS' END as Message
FROM ibmwatson_mdsdb.sn_customerservice_case_final SRC 
LEFT JOIN ibmwatson_mdwdb.f_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN ibmwatson_mdwdb.d_lov LKP 
	ON ( coalesce(concat('3RD_PARTY_STATUS_C~CASE~~~',SRC.u_3rd_party_status),'UNSPECIFIED') = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_3rd_party_status IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.third_party_status_src_c_key ,'')


