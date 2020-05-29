select CASE WHEN count(1) = 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) = 0 THEN 'requested_for_key do not exist in #DWH_TABLE_SCHEMA.f_request_item' ELSE 'SUCCESS' END as Message
from information_schema.columns
where table_name = '#TABLE_NAME'
and table_schema = '#DWH_TABLE_SCHEMA'
and column_name = 'requested_for_key'