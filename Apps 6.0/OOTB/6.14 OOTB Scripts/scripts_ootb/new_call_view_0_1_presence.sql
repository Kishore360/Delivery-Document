select 
case when count(1)=2 then 'SUCCESS' else 'FAILURE' end as result
,case when count(1)=2 then 'SUCCESS' else 'Views related to service desk does not exists' end as message
from #VIEWNAME
where row_key in ('0','-1');