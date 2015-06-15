


select case when count(1) <> 7 then 'FAILURE' ELSE 'SUCCESS' end AS Result,case when count(1) <> 7 then 'One of column in (''row_id'',''source_id'',''etl_run_number'',''created_by'',''changed_by'',''created_on'',''changed_on'') is missing' ELSE 'All required columns are present' end AS Message
from information_schema.columns
where column_name in ('row_id','source_id','etl_run_number','created_by','changed_by','created_on','changed_on')and table_name = '#TABLE_NAME' and table_schema = '#TABLE_SCHEMA'
