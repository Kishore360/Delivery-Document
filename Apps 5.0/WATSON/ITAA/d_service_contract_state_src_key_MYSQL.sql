
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service_contract.state_src_key' ELSE 'SUCCESS' END as Message
FROM watson_mdsdb.ast_contract_final SRC 
LEFT JOIN watson_mdwdb.d_service_contract TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN watson_mdwdb.d_lov LKP 
	ON ( coalesce(concat('STATE~SERVICE_CONTRACT~~~',SRC.state),'UNSPECIFIED') = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id AND dimension_class ='STATE~SERVICE_CONTRACT')
WHERE TRGT.row_key not in (0,-1) and SRC.account is not null AND
COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.state_src_key ,'')
