
select case when count(distinct #COL_NAME)<> count( #COL_NAME) then 'FAILURE' else 'SUCCESS' end as Result,
case when count(distinct #COL_NAME)<> count( #COL_NAME) then '#COL_NAME has duplicates in <<tablename>> ' else '' end as Message
from <<tenant>>_mdwdb.<<tablename>>;
