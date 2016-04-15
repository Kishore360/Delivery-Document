

select case when count(1) <> 0 then 'FAILURE' else 'SUCCESS' end as Result
,case when count(1) <> 0 then concat('These columns are not CHAR(1):', group_concat(InvalidCols separator ', ') )
else 'SUCCESS' end as Result
from (select concat(table_name,'.',column_name) as InvalidCols,column_type
from information_schema.columns
where table_schema  in ('<<tenant>>_workdb','molinahealth02_mdwdb') and table_name IN (SELECT 	table_name
 from information_schema.TABLES where table_schema  in ('<<tenant>>_workdb','molinahealth02_mdwdb') and table_type ='BASE TABLE')
and column_name like '%flag'
and column_type <> 'char(1)') A