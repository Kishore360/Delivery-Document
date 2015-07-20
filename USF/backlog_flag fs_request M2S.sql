
select case when count(*) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(*) > 0 then CONCAT_WS(count(*), 'invalid backlog_flag set for stg_#TABLE_NAME') else 'SUCCESS' end as Message
from (select * from #STG_TABLE_SCHEMA.#TABLE_NAME 
where state_src_code not in ('closed_rejected', 'closed_cancelled','closed_complete')
and backlog_flag <> 'Y' 
union
select * from #STG_TABLE_SCHEMA.#TABLE_NAME 
where state_src_code in ('closed_rejected', 'closed_cancelled','closed_complete')
and backlog_flag <> 'N'
) R
