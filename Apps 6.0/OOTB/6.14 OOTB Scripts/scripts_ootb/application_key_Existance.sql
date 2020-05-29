select CASE WHEN count(1) = 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) = 0 THEN 'application_key do not exist in #DWH_TABLE_SCHEMA.f_#TYPE' ELSE 'SUCCESS' END as Message
from information_schema.columns
where table_name = 'f_#TYPE'
and table_schema = '#DWH_TABLE_SCHEMA'
and column_name = 'application_key'