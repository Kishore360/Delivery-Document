select case when cnt > 1 then 'FAILURE' else 'SUCCESS' end as Result,
case when cnt > 1 then 'Duplicates exists in Dimensions' else 'SUCCESS' end as Message
from (
select 'd_configuration_item',row_id,source_id,count(1) cnt
from <<tenant>>_mdwdb.d_configuration_item
where soft_deleted_flag='N' group by 1,2
having count(1) > 1
union
select 'd_incident',row_id,source_id,count(1) cnt
from <<tenant>>_mdwdb.d_incident
where soft_deleted_flag='N' group by 1,2
having count(1) > 1
union
select 'd_internal_contact',row_id,source_id,count(1) cnt
from <<tenant>>_mdwdb.d_internal_contact
where soft_deleted_flag='N' group by 1,2
having count(1) > 1
union
select 'd_internal_organization',row_id,source_id,count(1) cnt
from <<tenant>>_mdwdb.d_internal_organization
where soft_deleted_flag='N' group by 1,2
having count(1) > 1
union
select 'd_location',row_id,source_id,count(1) cnt
from <<tenant>>_mdwdb.d_location
where soft_deleted_flag='N' group by 1,2
having count(1) > 1
union
select 'd_problem',row_id,source_id,count(1) cnt
from <<tenant>>_mdwdb.d_problem
where soft_deleted_flag='N' group by 1,2
having count(1) > 1
union
select 'd_problem_task',row_id,source_id,count(1) cnt
from <<tenant>>_mdwdb.d_problem_task
where soft_deleted_flag='N' group by 1,2
having count(1) > 1
union
select 'd_request',row_id,source_id,count(1) cnt
from <<tenant>>_mdwdb.d_request
where soft_deleted_flag='N' group by 1,2
having count(1) > 1
union
select 'd_request_item',row_id,source_id,count(1) cnt
from <<tenant>>_mdwdb.d_request_item
where soft_deleted_flag='N' group by 1,2
having count(1) > 1
union
select 'd_request_task',row_id,source_id,count(1) cnt
from <<tenant>>_mdwdb.d_request_task
where soft_deleted_flag='N' group by 1,2
having count(1) > 1
union
select 'd_task',row_id,source_id,count(1) cnt
from <<tenant>>_mdwdb.d_task
where soft_deleted_flag='N' group by 1,2
having count(1) > 1
union
select 'd_task_sla',row_id,source_id,count(1) cnt
from <<tenant>>_mdwdb.d_task_sla
where soft_deleted_flag='N' group by 1,2
having count(1) > 1
union
select 'd_master_item',row_id,source_id,count(1) cnt
from <<tenant>>_mdwdb.d_master_item
where soft_deleted_flag='N' group by 1,2
having count(1) > 1


)a