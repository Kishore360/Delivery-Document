

select routine_name
from information_schema.routines
where routine_schema ='#TABLE_SCHEMA'
order by 1
