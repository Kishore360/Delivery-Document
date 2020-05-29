select case when count(1) <> 1 then 'FAILURE' ELSE 'SUCCESS' end AS Result,case when count(1) <> 1 then
 'Column d_change_request.backlog_flag is not present' ELSE 'SUCCESS' end AS Message
from information_schema.columns
where column_name ='backlog_flag' and table_name = 'd_change_request' and table_schema = '#DWH_TABLE_SCHEMA'
