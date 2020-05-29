-- caused_by_change_numerify_key will be stamped if the Incident is opened after the Caused by Change Request is Closed
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.caused_by_change_numerify_key' ELSE 'SUCCESS' END as Message
from
(select inc.incident_key,
case when (UPPER(map.dimension_wh_code)='CLOSED' and 
inc_d.opened_on>=coalesce(chg_d.work_start_on,chg_d.planned_start_on,chg_d.closed_on)
) then chg.change_request_key 
else 0 end as caused_by_change_numerify_key

from (select * from #DWH_TABLE_SCHEMA.f_incident where soft_deleted_flag='N') inc
left join (select * from #DWH_TABLE_SCHEMA.d_incident where soft_deleted_flag='N') inc_d
on inc.incident_key=inc_d.row_key
left join (select * from #DWH_TABLE_SCHEMA.f_change_request where soft_deleted_flag='N') chg
on chg.change_request_key=inc.caused_by_change_key
left join (select * from #DWH_TABLE_SCHEMA.d_change_request where soft_deleted_flag='N') chg_d
on chg.change_request_key=chg_d.row_key
left join (select * from #DWH_TABLE_SCHEMA.d_lov_map where upper(wh_dimension_class) like '%WH_STATE~CHANGE_REQUEST%' and UPPER(dimension_wh_code)='CLOSED')map
on chg.state_src_key=map.src_key)SRC
left join (select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in (0,-1) and soft_deleted_flag='N') TRGT
on SRC.incident_key=TRGT.row_key
where SRC.caused_by_change_numerify_key<>TRGT.caused_by_change_numerify_key;