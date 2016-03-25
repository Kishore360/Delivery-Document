SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task_fss_c.opened_on_key' ELSE 'SUCCESS' END as Message
FROM gilead_mdsdb.u_task_fss_final SRC  LEFT JOIN gilead_mdwdb.f_task_fss_c TRGT 
 ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id)
LEFT JOIN gilead_mdwdb.d_calendar_date LKP on (LKP.row_id = date_format(convert_tz(SRC.opened_at,'GMT','America/New_York'),'%Y%m%d') and LKP.source_id=0 ) 
WHERE COALESCE(LKP.row_key,'') <> COALESCE(TRGT.opened_on_key,'');