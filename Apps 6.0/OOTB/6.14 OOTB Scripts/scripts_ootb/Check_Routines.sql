

select routine_name
from information_schema.routines
where routine_schema in (#SCHEMA_NAME)
order by 1
