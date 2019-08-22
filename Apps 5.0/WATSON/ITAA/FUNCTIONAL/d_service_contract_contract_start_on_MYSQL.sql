
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service_contract.contract_start_on' ELSE 'SUCCESS' END as Message
FROM watson_mdsdb.ast_contract_final SRC 
LEFT JOIN watson_mdwdb.d_service_contract TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE TRGT.row_key not in (0,-1) and SRC.account is not null AND
COALESCE(date_format(SRC.starts,'%Y%m%d'),'')<> COALESCE(date_format(TRGT.contract_start_on,'%Y%m%d'),'')
