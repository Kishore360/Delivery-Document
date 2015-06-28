


select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then CONCAT( CAST(COUNT(1) AS CHAR(10)), 'invalid first_call_resolution_flag set for stg.fs_incident') 
else 'SUCCESS' end as Message 
from (select 1 from <<tenant>>_workdb.fs_incident 
where  TIMESTAMPDIFF(MINUTE,opened_on_id,last_resolved_on_id)<30
union 
select 1 from <<tenant>>_workdb.fs_incident 
where  TIMESTAMPDIFF(MINUTE,opened_on_id,last_resolved_on_id)>=30
) R
