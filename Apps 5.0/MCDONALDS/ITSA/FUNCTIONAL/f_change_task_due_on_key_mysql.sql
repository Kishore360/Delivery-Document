

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.due_on_key' ELSE 'SUCCESS' END as Message
 FROM mcdonalds_mdsdb.change_task_final SRC
 LEFT JOIN mcdonalds_mdwdb.f_change_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN mcdonalds_mdwdb.d_calendar_date LKP 
on (LKP.row_id  = date_format(convert_tz(SRC.due_date,'GMT','America/New_York'),'%Y%m%d')  and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,'')  <> COALESCE(TRGT.due_on_key,'') 
