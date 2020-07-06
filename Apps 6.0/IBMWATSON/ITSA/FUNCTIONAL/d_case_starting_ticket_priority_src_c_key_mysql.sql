SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.ticket_priority_src_c_key' ELSE 'SUCCESS' END as Message
FROM ibmwatson_mdsdb.sn_customerservice_case_final SRC 
LEFT JOIN ibmwatson_mdwdb.d_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id and SRC.cdctype<>'D' )
LEFT JOIN ibmwatson_mdwdb.d_lov LKP 
	ON ( coalesce(concat('TICKET_PRIORITY_C~CASE~',SRC.u_ticket_priority),'UNSPECIFIED') = LKP.row_id
	)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_ticket_priority IS NULL THEN 0 else '-1' end)<> TRGT.starting_ticket_priority_src_c_key 


