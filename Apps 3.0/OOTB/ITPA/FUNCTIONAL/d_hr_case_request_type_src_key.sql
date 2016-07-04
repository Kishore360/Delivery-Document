
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_hr_case.request_type_src_key' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.hr_case_final SRC 
LEFT JOIN <<tenant>>_mdwdb.d_hr_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN <<tenant>>_mdwdb.d_lov LKP 
	ON ( COALESCE(CONCAT('REQUEST_TYPE','~','HR_CASE','~','~','~',UPPER(SRC.request_type)),'UNSPECIFIED') = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id AND dimension_class ='REQUESTTYPE~HR_CASE')
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.request_type IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.request_type_src_key ,'')
