-- caused_by_change_numerify_flag -If Problem’s application is same as Incident’s and Caused by Change Request’s application and Incident is opened after the Caused by Change Request is Closed, then set to Y, else N.
select SRC.caused_by_change_numerify_flag,TRGT.caused_by_change_numerify_flag
from
(select prob.problem_key,
-- Populate 'Y' when problem caused by change via Incident and Incident is opened after the implement date of CR and Incident, Problem, CR are of same application
-- Populate 'N' when problem caused by change via Incident and Incident is opened after the implement date of CR and Incident, Problem, CR are of different application
-- Populate 'N' when problem caused by change via Incident and Incident is opened before the implement date of CR 
-- Populate 'N' when problem is not caused by CR
case when (UPPER(map.dimension_name)='CLOSED' and inc_d.opened_on>=coalesce(chg_d.work_start_on,chg_d.planned_start_on,chg_d.closed_on) 
and prob.application_key=inc.application_key and inc.application_key=chg.application_key) then 'Y' 
-- when (UPPER(map.dimension_name)='CLOSED' and inc_d.opened_on>=coalesce(chg_d.work_start_on,chg_d.planned_start_on,chg_d.closed_on) 
-- and prob.application_key<>inc.application_key and inc.application_key<>chg.application_key) then 'N' 
else 'N' end as caused_by_change_numerify_flag
from (select * from #DWH_TABLE_SCHEMA.f_problem where soft_deleted_flag='N')prob
left join (select * from #DWH_TABLE_SCHEMA.f_incident where soft_deleted_flag='N')inc
on prob.problem_key=inc.problem_key
left join (select * from #DWH_TABLE_SCHEMA.d_incident where soft_deleted_flag='N') inc_d
on inc.incident_key=inc_d.row_key
left join (select * from #DWH_TABLE_SCHEMA.f_change_request where soft_deleted_flag='N')chg
on chg.change_request_key=inc.caused_by_change_key
left join (select * from #DWH_TABLE_SCHEMA.d_change_request where soft_deleted_flag='N') chg_d
on chg.change_request_key=chg_d.row_key
left join (select * from #DWH_TABLE_SCHEMA.d_lov_map where upper(wh_dimension_class) like '%WH_STATE~CHANGE_REQUEST%' and UPPER(dimension_wh_code)='CLOSED')map
on chg.state_src_key=map.src_key)SRC
left join (select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in (0,-1)) TRGT
on SRC.problem_key=TRGT.row_key
where SRC.caused_by_change_numerify_flag<>TRGT.caused_by_change_numerify_flag;