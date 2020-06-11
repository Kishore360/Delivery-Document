-- caused_by_change_numerify_flag(1.calculated for closed change requests, 2.incidents opened after the changes closed, 3.change_request and incident are of same application)
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.caused_by_change_numerify_flag' ELSE 'SUCCESS' END as Message
select SRC.caused_by_change_numerify_flag,TRGT.caused_by_change_numerify_flag,SRC.change_request_key,SRC.caused_by_change_key,SRC.chg_appl_key,SRC.inc_appl_key,SRC.opened_on,SRC.incident_key,SRC.closed_on
from
(select inc.incident_key,UPPER(map.dimension_wh_code),inc.opened_on_key as inc_opened_on_key,inc_d.opened_on,chg_d.closed_on,inc.caused_by_change_key,
chg.closed_on_key as chg_closed_on_key,chg.change_request_key as change_request_key,
chg.application_key as chg_appl_key,inc.application_key as inc_appl_key,

-- populate 'Y' when incidents opened after the implement date of CR and incidents, CR are of same application
-- populate 'N' when incidents opened after the implement date of CR and incidents, CR are of diff application
-- populate 'N' when incidents opened before the implement date of CR 
-- Populate 'N' when incidents are not caused by CR
case when (UPPER(map.dimension_wh_code)='CLOSED' and 
inc_d.opened_on>=coalesce(chg_d.work_start_on,chg_d.planned_start_on,chg_d.closed_on)
and inc.application_key=chg.application_key) then 'Y'
-- when (UPPER(map.dimension_wh_code)='CLOSED' and inc_d.opened_on>=coalesce(chg_d.work_start_on,chg_d.planned_start_on,chg_d.closed_on)
-- and inc.application_key<>chg.application_key) then 'N'
-- else 'X' 
else 'N' end as caused_by_change_numerify_flag

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
where SRC.caused_by_change_numerify_flag<>TRGT.caused_by_change_numerify_flag;