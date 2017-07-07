SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM cardinalhealth_mdsdb.time_card_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.d_task_c LKP
 on LKP.row_id = COALESCE(SRC.task,'UNSPECIFIED') and LKP.source_id  = SRC.sourceinstance
 JOIN cardinalhealth_mdwdb.d_calendar_date b ON SRC.week_starts_on = b.week_start_date
 LEFT JOIN cardinalhealth_mdwdb.f_time_entry_c TRGT 
 ON (concat(SRC.sys_id,'~',b.day_name) =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE coalesce(LKP.row_key,case when SRC.task is null then 0 else -1 end) <> TRGT.task_c_key)temp;