
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_case.state_src_key' ELSE 'SUCCESS' END as Message
FROM tjxco_mdsdb.sn_customerservice_case_final SRC 
LEFT JOIN tjxco_mdwdb.d_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN tjxco_mdwdb.d_lov LKP 
	ON ( coalesce(concat('STATE~CASE~',SRC.state),'UNSPECIFIED') = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end)<> (TRGT.state_src_key );


