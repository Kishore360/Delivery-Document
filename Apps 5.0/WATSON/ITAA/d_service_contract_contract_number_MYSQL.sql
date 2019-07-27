
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service_contract.contract_number' ELSE 'SUCCESS' END as Message
FROM watson_mdsdb.ast_contract_final SRC 
LEFT JOIN watson_mdwdb.d_service_contract TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE TRGT.row_key not in (0,-1) and SRC.account is not null AND
COALESCE(SRC.number,'')<> COALESCE(TRGT.contract_number,'')
