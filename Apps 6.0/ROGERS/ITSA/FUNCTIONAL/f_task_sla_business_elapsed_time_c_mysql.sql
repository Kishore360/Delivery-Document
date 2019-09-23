SELECT CASE WHEN a.cnt  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN a.cnt  THEN 'MDS to DWH data validation failed for f_task_sla.business_elapsed_time_c' ELSE 'SUCCESS' END as Message 
from (select count(1) as cnt
from rogers6_mdsdb.task_sla_final src 
join rogers6_mdsdb.task_final src1 on src.task=src1.sys_id and src.sourceinstance=src1.sourceinstance
join rogers6_mdwdb.f_task_sla trgt 
on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id 
where   CASE 
                    WHEN src.business_duration is null  THEN NULL   
                    WHEN TIMESTAMPDIFF(SECOND,
                    '1970-01-01 00:00:00',
                    src.business_duration) < 0 THEN NULL    
                    WHEN TIMESTAMPDIFF(SECOND,
                    '1970-01-01 00:00:00',
                    src.business_duration) > 214748364 THEN NULL     
                    ELSE TIMESTAMPDIFF(SECOND,
                    '1970-01-01 00:00:00',
                    src.business_duration) 
                end <> trgt.business_elapsed_time_c 
and src.CDCTYPE='X' and src1.CDCTYPE='X')a