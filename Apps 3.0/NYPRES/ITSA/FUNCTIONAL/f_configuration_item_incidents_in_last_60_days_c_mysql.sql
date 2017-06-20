

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from 
 nypres_mdwdb.f_configuration_item_c as trgt
inner join(
select tc.ci_item,tc.sourceinstance,count(tc.task) as source_count 
from nypres_mdsdb.task_ci_final as tc
inner join ( select cmdb_ci,sys_id,sourceinstance from nypres_mdsdb.incident_final 
join nypres_mdwdb.d_calendar_date d on d.row_id=date_format(convert_tz(opened_at,'GMT','America/New_york'),'%Y%m%d')
and d.lagging_count_of_days between 0 and 59) as inc
on tc.task=inc.sys_id and inc.sourceinstance=tc.sourceinstance
group by tc.ci_item,tc.sourceinstance
) as src
on trgt.row_id = src.ci_item and trgt.source_id = src.sourceinstance
where trgt.incidents_in_last_60_days_c <> src.source_count;






