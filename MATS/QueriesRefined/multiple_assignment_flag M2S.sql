


select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then count(1)|| 'invalid multiple_assignment_flag set for stg.<<tablename>>' else 'SUCCESS' end as Message
from (select 1 from <<tenant>>_mdwdb.<<tablename>> 
where reassignment_count > 1
and multiple_assignment_flag <> 'Y' 
union
select 1 from <<tenant>>_mdwdb.<<tablename>> 
where reassignment_count <= 1
and multiple_assignment_flag <> 'N'
) R

