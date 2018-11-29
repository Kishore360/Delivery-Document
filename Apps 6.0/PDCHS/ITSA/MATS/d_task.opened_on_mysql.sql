SELECT 

CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_task.opened_on' ELSE 'SUCCESS' END as Message 

FROM (select count(1) as cnt from (select sys_id, sourceinstance, opened_at  from  pdchs_mdsdb.task_final d where cdctype<>'D') SRC 

join pdchs_mdwdb.d_task lkp 

on SRC.sys_id=lkp.row_id and SRC.sourceinstance=lkp.source_id 

where convert_tz(SRC.opened_at,'GMT','America/New_York') <> lkp.opened_on) temp;