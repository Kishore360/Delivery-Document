
select routine_name
from information_schema.routines
where routine_schema ='#DWH_TABLE_SCHEMA'
order by 1
