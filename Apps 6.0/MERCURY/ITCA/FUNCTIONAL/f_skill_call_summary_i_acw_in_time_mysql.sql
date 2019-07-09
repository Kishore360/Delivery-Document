
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_skill_call_summary.i_acw_in_time' ELSE 'SUCCESS' END as Message
FROM mercury_mdsdb.dsplit_final SRC 
LEFT JOIN mercury_mdwdb.f_skill_call_summary TRGT 
	ON ( concat(left(from_unixtime(row_date/1000.0),24),'~',acd,'~',trim(split))  =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.i_acwintime,'')<> COALESCE(TRGT.i_acw_in_time,'')
