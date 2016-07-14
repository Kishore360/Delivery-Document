
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_hr_case.closed_on' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.hr_case_final SRC
LEFT JOIN <<tenant>>_mdwdb.d_hr_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT 
LEFT JOIN <<tenant>>_mdwdb.d_calendar_date LKP 
	ON (LKP.row_id = date_format(convert_tz(SRC.closed_at,'GMT','America/Los_Angeles'),'%Y%m%d')  and LKP.source_id=0)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.closed_at IS NULL THEN 0 else '-1' end) <> COALESCE(TRGT.closed_on,'')
