select case when count(1) <> 14 then 'FAILURE' ELSE 'SUCCESS' end AS Result,
case when count(1) <> 14 then 'Primary key present for the table' else 'No Primary Key for the table' end as Message
from information_schema.columns
where column_key != 'PRI'
and table_name = '<<tablename>>' and table_schema = '<<tenant>>_workdb';
