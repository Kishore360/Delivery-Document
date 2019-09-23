
SELECT CASE WHEN a.cnt  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN a.cnt  THEN 
'MDS to DWH data validation failed for d_task_ci_c.source_url' ELSE 'SUCCESS' END as Message 
from (
select count(1) as cnt
/* select CONCAT('https://rogers2.service-now.com//task.do?sys_id=',
                lkp.sys_id,
                '\" target=\"_blank\">',
                lkp.number,
                '</a>'), trgt.source_url*/
from rogers_mdsdb.task_ci_final src 
left join rogers_mdsdb.task_final lkp on src.task=lkp.sys_id
join rogers_mdwdb.d_task_ci_c trgt on src.sys_id=trgt.row_id 
and src.sourceinstance=trgt.source_id 
where CONCAT('<a href=\"https://rogers2.service-now.com//task.do?sys_id=',
                lkp.sys_id,
                '\" target=\"_blank\">',
                lkp.number,
                '</a>')<> trgt.source_url
and src.cdctype='X' and lkp.cdctype='X' )a;