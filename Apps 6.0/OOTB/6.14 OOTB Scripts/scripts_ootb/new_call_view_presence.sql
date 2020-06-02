select 
case when count(1)=4 then 'SUCCESS' else 'FAILURE' end as result
,case when count(1)=4 then 'SUCCESS' else 'Views related to service desk does not exists' end as message
from
pg_views
-- where viewname like '%call%'
where viewname in ('d_call','f_call','d_call_call_type','d_call_reported_type')