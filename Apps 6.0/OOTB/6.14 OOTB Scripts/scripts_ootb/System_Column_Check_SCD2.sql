

select case when count(1) <> 13 then 'FAILURE' ELSE 'SUCCESS' end AS Result,case when count(1) <> 13 then 'One of column in (''row_key'',''row_id'',''source_id'',''etl_run_number'',''soft_deleted_flag'',''created_by'',''changed_by'',''created_on'',''changed_on'',''dw_inserted_on''
,''dw_updated_on'',''row_dn_key'',''row_current_key'') is missing' ELSE 'All required columns are present' 
end AS Message
from information_schema.columns
where column_name in ('row_key','row_id','source_id','etl_run_number','soft_deleted_flag','created_by','changed_by','created_on','changed_on','dw_inserted_on','dw_updated_on','row_dn_key','row_current_key')and table_name = '#TABLE_NAME' and table_schema = '#DWH_TABLE_SCHEMA'
