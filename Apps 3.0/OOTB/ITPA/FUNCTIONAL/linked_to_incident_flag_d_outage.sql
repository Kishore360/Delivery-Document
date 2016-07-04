select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'LINKED_TO_INCIDENT_FLAG validation failed for d_outage' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdwdb.d_outage d
left join <<tenant>>_mdwdb.f_outage_task ft
on ft.outage_key=d.row_key
and ft.transaction_type='incident'
where d.ROW_key not in (0,-1) 
and ft.task_key not in (0,-1)
and COALESCE(case when ft.task_key is not null and COALESCE(ft.transaction_type, '') = 'incident' then 'Y'
else 'N' end, '')  <> 
d.LINKED_TO_INCIDENT_FLAG ;
