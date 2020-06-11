

select table_name,column_name,column_type 
from information_schema.columns
where table_schema in (#SCHEMA_NAME)
and table_name not like '%^_temp%' escape '^'
and table_name<>'d_calendar_date_month'
order by 1,2,3


