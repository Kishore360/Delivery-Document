select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Row count for f_incident_worknotes is 0' ELSE 'SUCCESS' END as Message 
from
( 
select count(*) as tot_rows from #DWH_TABLE_SCHEMA.f_incident_worknotes
) src
where coalesce(tot_rows,0)=0