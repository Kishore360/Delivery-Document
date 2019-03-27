 
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1)cnt  from
(SELECT concat(SRC.sys_id,'~',b.day_name) ABC,SRC.sourceinstance src,coalesce(c.row_key,case when SRC.task is null then 0 else -1 end) sr
 FROM cardinalhealth_mdsdb.time_card_final SRC 
 JOIN cardinalhealth_mdwdb.d_calendar_date b ON SRC.week_starts_on = b.week_start_date and SRC.sourceinstance=b.source_id
 and b.week_start_date>='2018-11-05'
 left join cardinalhealth_mdwdb.d_task_c c
on c.row_id=SRC.task and c.soft_deleted_flag='N'  
and SRC.sourceinstance=c.source_id 
)a

JOIN 

(select row_id,source_id,task_c_key vp from cardinalhealth_mdwdb.f_time_entry_c where soft_deleted_flag='N' and
 week_starts_on>='2018-11-05 00:00:00'  ) TRGT 
 ON  a.ABC =TRGT.row_id  AND a.src= TRGT.source_id  
 where a.sr<>TRGT.vp 
  ) a;