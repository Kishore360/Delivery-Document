SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.impact_src_code' 
ELSE 'MDS to DWH data validation passed for f_incident.impact_src_code' END as Message from 
(select count(1) cnt 
from
equifax_mdsdb.task_ci_final a
join
equifax_mdwdb.f_task_ci_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
join
equifax_mdwdb.d_calendar_date c
on COALESCE(DATE_FORMAT(CONVERT_TZ( a.sys_created_on,'GMT','America/New_York'),'%Y%m%d'),'UNSPECIFIED')=c.row_id and a.sourceinstance=c.source_id
where  coalesce(c.row_key,case when a.sys_created_on is null then 0 else -1 end ) <> b.created_on_key and a.cdctype<>'D')b