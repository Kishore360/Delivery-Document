


select case when count(*) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(*) > 0 then CONCAT( CAST(COUNT(*) AS CHAR(10)), 'invalid first_call_resolution_flag set for #TABLE_NAME') 
else 'SUCCESS' end as Message 
from (select * from #TABLE_SCHEMA.#TABLE_NAME 
where  TIMESTAMPDIFF(MINUTE,opened_on,#REF_COLUMN_NAME)<30
and backlog_flag <> 'Y' 
union 
select * from #TABLE_SCHEMA.#TABLE_NAME 
where  TIMESTAMPDIFF(MINUTE,opened_on,#REF_COLUMN_NAME)>=30
and backlog_flag <> 'N'
) R
