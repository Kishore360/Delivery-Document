 select case when count(1)>0 then 'SUCCESS' else 'FAILURE' end as Result
 ,case when count(1)>0 then 'SUCCESS' else 'View Unavailable' end as Message
 from pg_views
 where viewname in ('d_employee_parent_child')