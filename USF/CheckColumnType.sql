
select case when count(1) <> 1 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) <> 1 then '#COLUMN_NAME not present in <<tablename>>' else 'SUCCESS' end as Message
from information_schema.columns
where table_name = '<<tablename>>'
and table_schema ='usf_mdwdb'
and column_name = '#COLUMN_NAME'
and column_type = '#DATA_TYPE'
