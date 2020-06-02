select CASE WHEN count(1) = 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) =0 THEN 'USED_FOR_SRC_KEY do not exist in #DWH_TABLE_SCHEMA.d_service' ELSE 'SUCCESS' END as Message
from information_schema.columns
where table_name = 'd_service'
and table_schema = '#DWH_TABLE_SCHEMA'
and column_name = 'USED_FOR_SRC_KEY'