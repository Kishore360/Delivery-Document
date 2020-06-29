
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service_contract.source_id' ELSE 'SUCCESS' END as Message
FROM ibmwatson_mdsdb.ast_contract_final SRC 
LEFT JOIN ibmwatson_mdwdb.d_service_contract TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE TRGT.row_key not in (0,-1) and SRC.account is not null AND
COALESCE(SRC.sourceinstance,'')<> COALESCE(TRGT.source_id,'')
