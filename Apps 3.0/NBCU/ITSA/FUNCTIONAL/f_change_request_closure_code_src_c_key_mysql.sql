

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END as Message
FROM 
	nbcu_mdsdb.change_request_final a11
LEFT JOIN 
	nbcu_mdwdb.f_change_request TRGT 
	ON (a11.sys_id =TRGT.row_id AND a11.sourceinstance= TRGT.source_id  )
LEFT JOIN 
	nbcu_mdwdb.d_lov LKP 
	on CONCAT('CLOSURE_CODE_C','~','CHANGE_REQUEST','~','~','~',UPPER(a11.u_closure_code)) = LKP.row_id and LKP.source_id=a11.sourceinstance
WHERE  COALESCE(LKP.row_key,CASE WHEN a11.u_closure_code IS NULL THEN 0 else -1 end)<> TRGT.closure_code_src_c_key
