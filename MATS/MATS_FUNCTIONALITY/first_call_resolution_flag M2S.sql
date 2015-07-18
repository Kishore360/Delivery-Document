

select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then CONCAT( CAST(COUNT(1) AS CHAR(10)), 'invalid first_call_resolution_flag set for #STG_TABLE_NAME') 
else 'SUCCESS' end as Message 
from (select 1 from <<tenant>>_workdb.#STG_TABLE_NAME 
where  TIMESTAMPDIFF(MINUTE,opened_on,#REF_COLUMN_NAME)<30
and backlog_flag <> 'Y' 
union 
select 1 from <<tenant>>_workdb.#STG_TABLE_NAME 
where  TIMESTAMPDIFF(MINUTE,opened_on,#REF_COLUMN_NAME)>=30
and backlog_flag <> 'N'
) R
