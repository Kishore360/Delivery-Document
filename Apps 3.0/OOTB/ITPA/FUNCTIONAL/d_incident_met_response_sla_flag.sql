select case when count(1)>0 then 'FAILURE' else 'SUCCESS' end as result
,case  when count(1)>0 then 'MDS to DWH data validation failed:d_incident.met_response_sla_flag' else 'SUCCESS' end as message
from 
<<tenant>>_mdwdb.d_incident SRC
left join 
(select f.incident_key,f.task_type,d.sla_category,group_concat(outcome_flag,'') as flag
 from <<tenant>>_mdwdb.f_task_sla f
inner join <<tenant>>_mdwdb.d_task_sla d
on d.row_key=f.sla_key
-- and f.incident_key='1'
and f.task_type='incident'
and lower(d.sla_category) like '%response%'
group by f.incident_key,f.task_type,d.sla_category
)j
on SRC.row_key=j.incident_key
and j.task_type='incident'
where 
 case when  ( lower(j.sla_category)  like '%response%' and j.flag like '%Y%') then 'N'
else 'Y' end <>SRC.met_response_sla_flag;
