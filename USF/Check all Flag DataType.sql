
select case when count(1) <> 0 then 'FAILURE' else 'SUCCESS' end as Result
,case when count(1) <> 0 then concat('These columns are not CHAR(1):', group_concat(InvalidCols separator ', ') )
else 'SUCCESS' end as Result
from (select concat(table_name,'.',column_name) as InvalidCols
from information_schema.columns
where table_schema ='<<tenant>>_mdwdb'
and column_name like '%flag'
and column_type <> 'char(1)') A

