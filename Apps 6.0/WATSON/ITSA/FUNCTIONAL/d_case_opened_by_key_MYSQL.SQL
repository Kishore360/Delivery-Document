
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_case.opened_by_key' ELSE 'SUCCESS' END as Message
FROM ibmwatson_mdsdb.sn_customerservice_case_final SRC 
LEFT JOIN ibmwatson_mdwdb.d_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN ibmwatson_mdwdb.d_internal_contact LKP 
	ON ( coalesce(concat('INTERNAL_CONTACT~',SRC.opened_by),'UNSPECIFIED') = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id)
WHERE TRGT.row_key not in (0, -1) and 
 COALESCE(LKP.row_key,CASE WHEN SRC.opened_by IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.opened_by_key ,'')
