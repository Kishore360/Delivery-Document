




select case when count(distinct row_id)<> count( row_id) then 'FAILURE' else 'SUCCESS' end as Result,
case when count(distinct row_id)<> count( row_id) then 'ROW_ID has duplicates in <<tablename>> ' else '' end as Message
from <<tenant>>_workdb.<<tablename>>;
