
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_case.closed_by_key' ELSE 'SUCCESS' END as Message
FROM watson_mdsdb.sn_customerservice_case_final SRC 
LEFT JOIN watson_mdwdb.d_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN watson_mdwdb.d_internal_contact LKP 
	ON ( coalesce(SRC.sys_updated_by,'UNSPECIFIED') = LKP.user_name
	AND SRC.sourceinstance=LKP.source_id)
WHERE TRGT.row_key not in (0, -1) and 
COALESCE(LKP.row_key,CASE WHEN SRC.sys_updated_by IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.updated_by_key ,'');
