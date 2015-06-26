select case when count(1)<1 then 'Failure' else 'Success' end as Result,
case when count(1)<1 then 'No records found' else 'Records found' end as Message from





(select table_name,column_name,column_type 
from information_schema.columns
where table_schema ='pgi_mdwdb'
and (table_name like 'fs_%' or 'ds%'
or table_name like 'f_%' or 'd_%')
order by 1,2,3) a;


