
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.closed_by_key' ELSE 'SUCCESS' END as Message
FROM ibmwatson_mdsdb.sn_customerservice_case_final SRC 
LEFT JOIN ibmwatson_mdwdb.f_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN ibmwatson_mdwdb.d_internal_contact LKP 
	ON ( Coalesce(concat('INTERNAL_CONTACT~',SRC.closed_by),'UNSPECIFIED') = LKP.row_id	AND SRC.sourceinstance=LKP.source_id)
LEFT JOIN ibmwatson_mdwdb.d_lov_map LM ON TRGT.state_src_key=LM.src_key and LM.dimension_class = 'STATE~CASE'
  AND LM.dimension_wh_code not in ('RESOLVED','CLOSED')
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.closed_by IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.closed_by_key ,'')
and SRC.cdctype<>'D'and LM.dimension_wh_code is not null
