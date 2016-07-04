SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_case.caused_by_change_key' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.sn_customerservice_case_final SRC 
LEFT JOIN <<tenant>>_mdwdb.d_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN <<tenant>>_mdwdb.d_change_request LKP 
	ON ( Coalesce(SRC.caused_by,'UNSPECIFIED') = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.caused_by IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.caused_by_change_key ,'')
