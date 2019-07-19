
SELECT CASE WHEN cnt> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for f_case.opened_time_key' ELSE 'SUCCESS' END as Message
FROM (select count(1) as cnt from watson_mdsdb.sn_customerservice_case_final SRC
LEFT JOIN watson_mdwdb.f_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN watson_mdwdb.d_calendar_time LKP 
	ON(LKP.row_id = date_format(convert_tz(SRC.opened_at,'GMT','UTC'),'%H%i') and LKP.source_id=0)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.opened_at IS NULL THEN 0 else '-1' end)<>TRGT.opened_time_key and TRGT.soft_deleted_flag='N')ma 