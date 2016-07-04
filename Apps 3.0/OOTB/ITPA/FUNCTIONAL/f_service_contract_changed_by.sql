
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_service_contract.changed_by' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.ast_contract_final SRC 
LEFT JOIN <<tenant>>_mdwdb.f_service_contract TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.sys_updated_by,'')<> COALESCE(TRGT.changed_by,'')
