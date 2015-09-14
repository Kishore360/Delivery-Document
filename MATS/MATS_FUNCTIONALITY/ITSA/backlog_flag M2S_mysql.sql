


select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then CONCAT_WS(count(1), 'invalid backlog_flag set for <<tablename>>') else 'SUCCESS' end as Message
from (select 1 from <<tenant>>_mdwdb.<<tablename>> 
where state_src_code not in ('6', '7')
and backlog_flag <> 'Y' 
union
select 1 from <<tenant>>_mdwdb.<<tablename>> 
where state_src_code in ('6', '7')
and backlog_flag <> 'N'
) R

