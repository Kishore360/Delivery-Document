select case when count(1)<1 then 'Failure' else 'Success' end as Result,
case when count(1)<1 then 'No records found' else 'Records found' end as Message from

(

select routine_name
from information_schema.routines
where routine_schema ='<<tenant>>_mdwdb'
order by 1) a;



#no routine names.