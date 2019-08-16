SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_case.closed_by_key' ELSE 'SUCCESS' END as Message
FROM watson_mdsdb.sn_customerservice_case_final SRC 
LEFT JOIN watson_mdwdb.d_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN watson_mdwdb.d_internal_contact LKP 
	ON ( coalesce(concat('INTERNAL_CONTACT~',SRC.closed_by),'UNSPECIFIED') = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id)
	LEFT JOIN watson_mdwdb.d_lov_map LM ON TRGT.state_src_key=LM.src_key and LM.dimension_class = 'STATE~CASE'
  AND LM.dimension_wh_code not in ('RESOLVED','CLOSED')
WHERE 
COALESCE(LKP.row_key,CASE WHEN SRC.closed_by IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.closed_by_key ,'')
