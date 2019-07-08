
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_skill_call_summary.time_key' ELSE 'SUCCESS' END as Message
FROM mercury_mdsdb.dsplit_final SRC 
LEFT JOIN mercury_mdwdb.f_skill_call_summary TRGT 
	ON ( concat(row_date,'~',acd,'~',trim(split))  =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
 LEFT JOIN mercury_mdwdb.d_calendar_time LKP 
on (LKP.row_id  = SRC.row_date  and LKP.source_id=0)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.row_date IS NULL THEN 0 else '' end) <> COALESCE(TRGT.time_key,'')
