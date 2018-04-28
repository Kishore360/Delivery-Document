	select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.opened_time_key' ELSE 'SUCCESS' END as Message
from tjx_mdsdb.change_task_final SRC
left join tjx_mdwdb.f_change_task TRGT 
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance = TRGT.source_id ) 
 left join tjx_mdwdb.d_calendar_time cal
 on cal.row_id = DATE_FORMAT(convert_tz(SRC.opened_at, 'GMT','America/New_York'),'%H%i')
 where coalesce(cal.row_key,'') <> coalesce(TRGT.opened_time_key,'');
 
 
 
