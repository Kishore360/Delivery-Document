

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from 
(select cmdb_ci,count(t.number)cnt
from (select  number,opened_at,cmdb_ci,sourceinstance,sys_id from nypres_mdsdb.task_final 
join  nypres_mdwdb.d_calendar_date d on d.row_id=date_format(convert_tz(opened_at,'GMT','America/New_york'),'%Y%m%d')
where sys_class_name='change_request' 
and d.lagging_count_of_days between 0 and 89  ) t  
join  nypres_mdsdb.task_ci_final c on c.task=t.sys_id and t.cmdb_ci=c.ci_item and c.sourceinstance=t.sourceinstance
group by t.cmdb_ci)src
join 
(select row_id,changes_in_last_90_days_c  from nypres_mdwdb.f_configuration_item) trgt
on src.cmdb_ci=tgrt.row_id 
where src.cnt <>trgt.changes_in_last_90_days_c


