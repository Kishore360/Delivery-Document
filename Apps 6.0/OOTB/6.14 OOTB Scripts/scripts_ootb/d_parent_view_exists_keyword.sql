select case when count(1)>0 then 'FAILURE' else 'SUCCESS' end as result
,case when count(1)>0 then 'd_parent_incident has exists keyword' else 'SUCCESS' end as message
from pg_views
where viewname='d_parent_incident'
and  definition    like '%EXISTS%' 