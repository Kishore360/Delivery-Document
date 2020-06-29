
SELECT CASE WHEN cnt> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_case.opened_on_key' ELSE 'SUCCESS' END as Message
FROM (select count(1) as cnt from ibmwatson_mdsdb.sn_customerservice_case_final SRC
LEFT JOIN ibmwatson_mdwdb.f_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN ibmwatson_mdwdb.d_calendar_date LKP 
	ON(LKP.row_id = date_format(convert_tz(SRC.opened_at,'GMT','UTC'),'%Y%m%d') and LKP.source_id=0)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.opened_at IS NULL THEN 0 else '-1' end)  <> TRGT.opened_on_key and TRGT.soft_deleted_flag='N')ma
