select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.problems_caused_outside_application' ELSE 'SUCCESS' END as Message
from
(select change_request,change_request_key as change_request_key,count(problems_for_diff_application) as problems_for_diff_application
from
(select chgd.change_request_number as change_request,chgd.row_key as change_request_key,
case when (UPPER(map.dimension_name)='CLOSED' and inc.problem_key not in (0,-1) and prob.opened_on_key>=chg.closed_on_key and
inc.caused_by_change_key<>0 and chg.application_key<>prob.application_key) then (inc.incident_key) else null end as problems_for_diff_application

from #DWH_TABLE_SCHEMA.f_change_request chg
left join #DWH_TABLE_SCHEMA.d_change_request chgd
on chgd.row_key=chg.change_request_key
left join (select * from #DWH_TABLE_SCHEMA.d_lov where upper(dimension_class)='STATE~CHANGE_REQUEST' and UPPER(dimension_name)='CLOSED')map
on chg.state_src_key=map.row_key
left join #DWH_TABLE_SCHEMA.f_incident inc
on chg.change_request_key=inc.caused_by_change_key
left join #DWH_TABLE_SCHEMA.f_problem prob
on prob.problem_key=inc.problem_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cal.row_key=chg.closed_on_key)problems_outs_application
group by problems_outs_application.change_request_key)SRC
left join #DWH_TABLE_SCHEMA.d_change_failure chg_failure
on chg_failure.change_request_key=SRC.change_request_key
where SRC.problems_for_diff_application<>chg_failure.problems_caused_outside_application;

-- using flag from d_problem
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.problems_caused_outside_application' ELSE 'SUCCESS' END as Message
from
(select application_key,caused_by_change_key,count(caused_by_change_flag) as problems_caused_outside_application 
from #DWH_TABLE_SCHEMA.f_problem where caused_by_change_flag='N'
group by 1,2)SRC
left join (select * from #DWH_TABLE_SCHEMA.d_change_failure where current_flag='Y')TRGT
on SRC.caused_by_change_key=TRGT.change_request_key
where SRC.problems_caused_outside_application<>TRGT.problems_caused_outside_application