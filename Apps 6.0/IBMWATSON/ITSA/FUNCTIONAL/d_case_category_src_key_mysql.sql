
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_case.category_src_key' ELSE 'SUCCESS' END as Message
FROM ibmwatson_mdsdb.sn_customerservice_case_final SRC 
LEFT JOIN ibmwatson_mdwdb.d_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN ibmwatson_mdwdb.d_lov LKP 
	ON ( coalesce(concat('CATEGORY~CASE~',SRC.category),'UNSPECIFIED') = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id AND dimension_class ='CATEGORY~CASE')
WHERE TRGT.row_key not in (0, -1) and 
COALESCE(LKP.row_key,CASE WHEN SRC.category IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.category_src_key ,'')
