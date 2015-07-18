
select table_name,column_name,column_type 
from information_schema.columns
where table_schema ='<<tenant>>_mdwdb'
and (table_name like 'ds%'
or table_name like 'd%' or table_name like 'fs%'
or table_name like 'f%'
or table_name like 'dhs%'
or table_name like 'dh%')
order by 1,2,3


