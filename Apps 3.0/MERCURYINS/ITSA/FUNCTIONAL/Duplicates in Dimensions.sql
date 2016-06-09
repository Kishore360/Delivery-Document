select case when count(1) > 1 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 1 then 'Duplicates exists in Dimensions' else 'SUCCESS' end as Message
from (
select 'd_configuration_item',row_id,source_id,count(1)
from mercuryins_mdwdb.d_configuration_item
group by 1,2
having count(1) > 1
union
select 'd_incident',row_id,source_id,count(1)
from mercuryins_mdwdb.d_incident
group by 1,2
having count(1) > 1
union
select 'd_internal_contact',row_id,source_id,count(1)
from mercuryins_mdwdb.d_internal_contact
group by 1,2
having count(1) > 1
union
select 'd_internal_organization',row_id,source_id,count(1)
from mercuryins_mdwdb.d_internal_organization
group by 1,2
having count(1) > 1
union
select 'd_location',row_id,source_id,count(1)
from mercuryins_mdwdb.d_location
group by 1,2
having count(1) > 1
union
select 'd_problem',row_id,source_id,count(1)
from mercuryins_mdwdb.d_problem
group by 1,2
having count(1) > 1
union
select 'd_problem_task',row_id,source_id,count(1)
from mercuryins_mdwdb.d_problem_task
group by 1,2
having count(1) > 1
union
select 'd_request',row_id,source_id,count(1)
from mercuryins_mdwdb.d_request
group by 1,2
having count(1) > 1
union
select 'd_request_item',row_id,source_id,count(1)
from mercuryins_mdwdb.d_request_item
group by 1,2
having count(1) > 1
union
select 'd_request_task',row_id,source_id,count(1)
from mercuryins_mdwdb.d_request_task
group by 1,2
having count(1) > 1
union
select 'd_task',row_id,source_id,count(1)
from mercuryins_mdwdb.d_task
group by 1,2
having count(1) > 1
union
select 'd_task_sla',row_id,source_id,count(1)
from mercuryins_mdwdb.d_task_sla
group by 1,2
having count(1) > 1
union
select 'd_master_item',row_id,source_id,count(1)
from mercuryins_mdwdb.d_master_item
group by 1,2
having count(1) > 1


)a