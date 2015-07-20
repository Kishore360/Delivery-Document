
select case when count(*) <> 0 then 'FAILURE' else 'SUCCESS' end as Result
,case when count(*) <> 0 then concat('These columns are not #DATA_TYPE:', group_concat(InvalidCols separator ', ') )
else 'SUCCESS' end as Result
from (select concat(table_name,'.',column_name) as InvalidCols
from information_schema.columns
where table_schema ='#TABLE_SCHEMA'
and column_name = '#COLUMN_NAME'
and column_type <> '#DATA_TYPE') A
