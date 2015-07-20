
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then CONCAT_WS(count(1), 'invalid backlog_flag set for stg_<<tablename>>') else 'SUCCESS' end as Message
from (select 1 from usf_workdb.<<tablename>> 
where state_src_code not in ('closed_rejected', 'closed_cancelled','closed_complete')
and backlog_flag <> 'Y' 
union
select 1 from usf_workdb.<<tablename>> 
where state_src_code in ('closed_rejected', 'closed_cancelled','closed_complete')
and backlog_flag <> 'N'
) R
