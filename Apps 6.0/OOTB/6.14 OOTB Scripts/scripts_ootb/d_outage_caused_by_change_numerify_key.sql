SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_outage.caused_by_change_numerify_key' ELSE 'SUCCESS' END as Message
from
(select f_outage.outage_key as outage_key,
case when (f_outage.change_request_key<>0 and UPPER(map.dimension_name)='CLOSED' and
and d_outage.start_on>=coalesce(chg_d1.work_start_on,chg_d1.planned_start_on,chg_d1.closed_on) 
and f_outage.incident_key=0 and f_outage.application_key=chg1.application_key) 
then f_outage.change_request_key
when (f_outage.change_request_key<>0 and UPPER(map.dimension_name)='CLOSED' and 
and inc_d.opened_on>=coalesce(chg_d.work_start_on,chg_d.planned_start_on,chg_d.closed_on)
and f_outage.incident_key<>0 and f_outage.application_key=inc_f.application_key and inc_f.application_key=chg.application_key) 
then inc_f.caused_by_change_key
else 0 end as caused_by_change_numerify_key

from #DWH_TABLE_SCHEMA.f_outage f_outage
left join #DWH_TABLE_SCHEMA.d_outage d_outage
on f_outage.outage_key=d_outage.row_key
left join #DWH_TABLE_SCHEMA.f_incident inc_f
on inc_f.incident_key=f_outage.incident_key
left join #DWH_TABLE_SCHEMA.d_incident inc_d
on inc_d.row_key=inc_f.incident_key
left join #DWH_TABLE_SCHEMA.f_change_request chg
on chg.change_request_key=inc_f.caused_by_change_key
left join #DWH_TABLE_SCHEMA.f_change_request chg1
on chg1.change_request_key=f_outage.change_request_key
left join #DWH_TABLE_SCHEMA.d_change_request chg_d
on chg_d.row_key=chg.change_request_key
left join #DWH_TABLE_SCHEMA.d_change_request chg_d1
on chg_d1.row_key=chg1.change_request_key
left join (select * from #DWH_TABLE_SCHEMA.d_lov where upper(dimension_class)='STATE~CHANGE_REQUEST' and UPPER(dimension_name)='CLOSED')map
on chg.state_src_key=map.row_key)SRC
left join (select * from #DWH_TABLE_SCHEMA.d_outage where row_key not in (0,-1)) TRGT
on SRC.outage_key=TRGT.row_key
where SRC.caused_by_change_numerify_key<>TRGT.caused_by_change_numerify_key;