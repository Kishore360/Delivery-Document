select case when count(1)> 0 then 'FAILURE' ELSE 'SUCCESS' end AS Result,
case when count(1)> 0 then 'sla_category is not in Camel case' else 'Success' end as Message
from <<tenant>>_mdwdb.d_task_sla TRGT
where binary coalesce(CONCAT( UPPER(SUBSTR(TRGT.sla_category,1,1)), SUBSTR(TRGT.sla_category,2) ),'') != coalesce(TRGT.sla_category,'');
