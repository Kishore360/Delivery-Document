SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service_contract.renewal_start_on' ELSE 'SUCCESS' END as Message
FROM ibmwatson_mdsdb.ast_contract_final SRC 
LEFT JOIN ibmwatson_mdwdb.d_service_contract TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE SRC.account is not null AND
COALESCE(date_format(convert_tz(SRC.renewal_date,'GMT','America/New_York'),'%Y%m%d'),'')<> COALESCE(date_format(TRGT.renewal_start_on,'%Y%m%d'),'')
