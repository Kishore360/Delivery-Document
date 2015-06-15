

select case when count(*) <> 1 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(*) <> 1 then '#COLUMN_NAME not present in #TABLE_NAME' else 'SUCCESS' end as Message
from information_schema.columns
where table_name = '#TABLE_NAME'
and table_schema ='#TABLE_SCHEMA'
and column_name = '#COLUMN_NAME'
and column_type = '#DATA_TYPE'
