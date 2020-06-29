
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_service_contract.changed_on' ELSE 'SUCCESS' END as Message
  FROM ibmwatson_mdsdb.ast_contract_final SRC 
LEFT JOIN ibmwatson_mdwdb.f_service_contract TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE SRC.account is not null AND convert_tz(SRC.sys_updated_on,'GMT','America/New_York')<> TRGT.changed_on 
