SELECT CASE WHEN CNT >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_certification_task_c.opened_on_key' ELSE 'SUCCESS' END as Message 
FROM (
select count(*) as CNT from gilead_mdsdb.cert_task_final SRC
LEFT JOIN  gilead_mdwdb.f_certification_task_c trgt
on SRC.sys_id = trgt.row_id and SRC.sourceinstance = trgt.source_id
LEFT JOIN gilead_mdwdb.d_calendar_date LKP 
on (LKP.row_id = COALESCE(date_format(convert_tz(SRC.opened_at,'GMT','America/New_York'),'%Y%m%d'), 'UNSPECIFIED') and LKP.source_id=0
) WHERE COALESCE(LKP.row_key, CASE WHEN SRC.opened_at is NULL THEN 0 ELSE -1 END) <> (trgt.opened_on_key))t 

;