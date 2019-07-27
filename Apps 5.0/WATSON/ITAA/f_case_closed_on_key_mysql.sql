SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_case.closed_on_key' ELSE 'SUCCESS' END as Message
FROM (select count(1) as cnt from watson_mdsdb.sn_customerservice_case_final SRC
LEFT JOIN watson_mdwdb.f_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN watson_mdwdb.d_calendar_date LKP 
	ON(LKP.row_id = date_format(convert_tz(SRC.closed_at,'GMT','UTC'),'%Y%m%d') and LKP.source_id=0)
WHERE LKP.row_key<>TRGT.closed_on_key )ma
