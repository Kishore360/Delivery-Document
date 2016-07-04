
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_hr_case.company_id' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.hr_case_final SRC 
LEFT JOIN <<tenant>>_mdwdb.f_hr_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(CONCAT('SUBSIDIARY~',SRC.company) ,'')<> COALESCE(TRGT.company_id ,'')
