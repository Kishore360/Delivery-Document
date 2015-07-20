
select case when count(distinct #COL_NAME)<> count( #COL_NAME) then 'FAILURE' else 'SUCCESS' end as Result,
case when count(distinct #COL_NAME)<> count( #COL_NAME) then '#COL_NAME has duplicates in #TABLE_NAME ' else '' end as Message
from #DWH_TABLE_SCHEMA.#TABLE_NAME;
