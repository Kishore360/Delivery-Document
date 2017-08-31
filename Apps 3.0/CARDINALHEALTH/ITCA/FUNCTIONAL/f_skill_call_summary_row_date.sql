
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_skill_call_summary.row_date' ELSE 'SUCCESS' END as Message
FROM cardinalhealth_mdsdb.dsplit_final SRC
LEFT JOIN cardinalhealth_mdwdb.f_skill_call_summary TRGT 
	ON (concat(row_date,'~',acd,'~',split) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN cardinalhealth_mdwdb.d_calendar_date LKP 
	ON (LKP.row_id = date_format(SRC.row_date,'%Y%m%d')  and LKP.source_id=0)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.row_date IS NULL THEN 0 else '-1' end) <> COALESCE(TRGT.row_date,'')
