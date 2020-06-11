select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'multiple_ci_flag validation failed for d_outage' ELSE 'SUCCESS' END as Message
from #DWH_TABLE_SCHEMA.d_outage TGT
left join #DWH_TABLE_SCHEMA.f_outage f
on f.outage_key=TGT.row_key
left join #DWH_TABLE_SCHEMA.f_incident f_inc
on f.incident_key=f_inc.incident_key
where case when f.configuration_item_key<>f_inc.configuration_item_key 
and f.configuration_item_key not in (0,-1)
and f_inc.configuration_item_key not in (0,-1)
then 'Y' else 'N' end <> TGT.multiple_ci_flag
and TGT.row_key not in (0,-1);