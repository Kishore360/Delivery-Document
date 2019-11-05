SELECT CASE WHEN a.cnt  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN a.cnt  THEN 
'MDS to DWH data validation failed for f_task_ci_c.opened_on_key' ELSE 'SUCCESS' END as Message 
from (select count(1) as cnt
from rogers6_mdsdb.task_ci_final src 
join rogers6_mdsdb.task_final src1 on src.task=src1.sys_id and src.sourceinstance=src1.sourceinstance
join rogers6_mdwdb.f_task_ci_c trgt 
on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id 
where COALESCE(DATE_FORMAT(CONVERT_TZ(src1.opened_at,
                'GMT',
                'America/New_York'),
                '%Y%m%d'),
                'UNSPECIFIED') <> trgt.opened_on_key
and src.CDCTYPE='X' and src1.CDCTYPE='X')a