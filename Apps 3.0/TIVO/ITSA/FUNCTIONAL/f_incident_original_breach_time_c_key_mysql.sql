SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.work_start_on_key' ELSE 'SUCCESS' END as Message
 FROM  (
select max(coalesce(convert_tz(tsla.u_true_breach_time,'GMT','America/Los_Angeles'),
convert_tz(tsla.planned_end_time,'GMT','America/Los_Angeles'))) AS BREACHED_TIME,inc.sys_id sys_id,
inc.sourceinstance sourceinstance
from   tivo_mdsdb.incident_final inc
left join tivo_mdsdb.task_sla_final tsla on inc.sys_id=tsla.task 
join tivo_mdsdb.contract_sla_final csla on tsla.sla = csla.sys_id
where csla.name like '%Resolution%' and tsla.stage not in ('cancelled','retired')
group by inc.sys_id,inc.sourceinstance)x
left join 
tivo_mdwdb.f_incident TRGT
on x.sys_id=TRGT.row_id and x.sourceinstance=TRGT.source_id
left join tivo_mdwdb.d_calendar_date LKP
on 
date_format(BREACHED_TIME,'%Y%m%d')=LKP.row_id
where LKP.row_key<>TRGT.original_breach_time_c_key
#and x.sys_id='002471db6f88264084ae8c226e3ee4aa'
