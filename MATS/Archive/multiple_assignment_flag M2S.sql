


select case when count(*) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(*) > 0 then count(*)|| 'invalid multiple_assignment_flag set for stg.#TABLE_NAME' else 'SUCCESS' end as Message
from (select * from #TABLE_SCHEMA.#TABLE_NAME 
where reassignment_count > 1
and multiple_assignment_flag <> 'Y' 
union
select * from #TABLE_SCHEMA.#TABLE_NAME 
where reassignment_count <= 1
and multiple_assignment_flag <> 'N'
) R

