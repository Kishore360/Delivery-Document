 select case when count(1)>0 then 'FAILURE' else 'SUCCESS' end as result
,case  when count(1)>0 then 'MDS to DWH data validation failed:d_incident.met_resolution_sla_flag' else 'SUCCESS' end as message
 
from 
(select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in (0,-1) and soft_deleted_flag ='N') SRC
left join 
(select f.incident_key,f.task_type,d.sla_category,group_concat(outcome_flag,'') as flag
 from #DWH_TABLE_SCHEMA.f_task_sla f
inner join #DWH_TABLE_SCHEMA.d_task_sla d
on d.row_key=f.sla_key
-- and f.incident_key='1'
and f.task_type='incident'
and lower(d.sla_category) like '%resolution%'
group by f.incident_key,f.task_type,d.sla_category
)j
on SRC.row_key=j.incident_key
and j.task_type='incident'
where 
 case when  ( lower(j.sla_category)  like '%resolution%' and j.flag like '%Y%') then 'N'
else 'Y' end <>SRC.met_resolution_sla_flag