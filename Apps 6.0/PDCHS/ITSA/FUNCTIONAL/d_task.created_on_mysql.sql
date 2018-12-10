SELECT 

CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_task.created_on' ELSE 'SUCCESS' END as Message 

FROM (select count(1) as cnt from (select * from pdchs_mdsdb.task_final where cdctype<>'D') SRC 

left join pdchs_mdwdb.d_task trgt 

on SRC.sys_id=trgt.row_id and SRC.sourceinstance=trgt.source_id 

where convert_tz(SRC.sys_created_on,'GMT', 'America/New_York') <> trgt.created_on) temp;