



select case when count(*) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(*) > 0 then CONCAT( CAST(COUNT(*) AS CHAR(10)), 'invalid major_incident_flag set for stg.fs_incident') 
else 'SUCCESS' end as Message
from (select * from #TABLE_SCHEMA.fs_incident 
where priority_src_code = 1
and major_incident_flag<> 'Y'
) R

