

select table_name,column_name,column_type 
from information_schema.columns
where table_schema ='<<tenant>>_mdwdb'
and (table_name like 'stg%'
or table_name like 'dwh%')
order by 1,2,3


