SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Some flag columns are not char(1)' ELSE 'SUCCESS' END as Message
FROM information_schema.columns C
join information_schema.tables T
on(T.table_name=C.table_name
and T.table_schema=C.table_schema)
where T.table_schema in('#STG_TABLE_SCHEMA','#DWH_TABLE_SCHEMA')
and column_name like '%flag' -- and T.table_type<>'VIEW'
and data_type not in ('char', 'varchar')
and character_maximum_length<>1