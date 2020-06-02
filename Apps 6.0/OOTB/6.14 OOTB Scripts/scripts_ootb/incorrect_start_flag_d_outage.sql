select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'incorrect_start_flag validation failed for d_outage' ELSE 'SUCCESS' END as Message
from #DWH_TABLE_SCHEMA.d_outage d
left join #DWH_TABLE_SCHEMA.f_outage f
on f.outage_key=d.row_key
left join #DWH_TABLE_SCHEMA.d_incident d_inc
on f.incident_key=d_inc.row_key 
where d.incorrect_start_flag <> case when d.start_on>d_inc.opened_on then 'Y' else 'N' end
and d.row_key not in (0,-1);