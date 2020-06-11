-- caused_by_change_numerify_key --First the associated Incident will be identified and the corresponding Incident’s Caused by Change Request key will be stamped if the Incident is opened after the Caused by Change Request is Closed
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_outage.caused_by_change_key' ELSE 'SUCCESS' END as Message
from
(select prob.problem_key,case when (UPPER(map.dimension_name)='CLOSED' and 
inc_d.opened_on>=coalesce(chg_d.work_start_on,chg_d.planned_start_on,chg_d.closed_on) 
) then inc.caused_by_change_key else 0 end as caused_by_change_numerify_key
from #DWH_TABLE_SCHEMA.f_problem prob
left join #DWH_TABLE_SCHEMA.f_incident inc
on prob.problem_key=inc.problem_key
left join #DWH_TABLE_SCHEMA.d_incident inc_d
on inc.incident_key=inc_d.row_key
left join #DWH_TABLE_SCHEMA.f_change_request chg
on chg.change_request_key=inc.caused_by_change_key
left join #DWH_TABLE_SCHEMA.d_change_request chg_d
on chg.change_request_key=chg_d.row_key
left join (select * from #DWH_TABLE_SCHEMA.d_lov where upper(dimension_class)='STATE~CHANGE_REQUEST' and UPPER(dimension_name)='CLOSED')map
on chg.state_src_key=map.row_key)SRC
left join (select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in (0,-1)) TRGT
on SRC.problem_key=TRGT.row_key
where SRC.caused_by_change_numerify_key<>TRGT.caused_by_change_numerify_key;