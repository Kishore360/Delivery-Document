

select routine_name
from information_schema.routines
where routine_schema ='<<tenant>>_mdwdb'
order by 1
