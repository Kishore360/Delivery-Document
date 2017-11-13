
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.due_on_key' ELSE 'SUCCESS' END as Message
FROM watson_mdsdb.sn_customerservice_case_final SRC
LEFT JOIN watson_mdwdb.f_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN watson_mdwdb.d_calendar_date LKP 
	ON(LKP.row_id = date_format(convert_tz(SRC.due_date,'GMT','America/New_York'),'%Y%m%d') and LKP.source_id=0)
WHERE COALESCE(LKP.row_key,'')  <> COALESCE(TRGT.due_on_key,'') 
