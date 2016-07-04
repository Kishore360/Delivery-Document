
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_hr_case.request_type_src_id' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.hr_case_final SRC 
LEFT JOIN <<tenant>>_mdwdb.d_hr_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(COALESCE(CONCAT('REQUEST_TYPE','~','HR_CASE','~','~','~',UPPER(SRC.request_type)),'UNSPECIFIED') ,'')<> COALESCE(TRGT.request_type_src_id ,'')
