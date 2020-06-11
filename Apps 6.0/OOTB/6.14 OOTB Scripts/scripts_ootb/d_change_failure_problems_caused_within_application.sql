select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.problems_caused_within_application' ELSE 'SUCCESS' END as Message
from
(select change_request,change_request_key as change_request_key,count(problems_for_same_application) as problems_for_same_application
from
(select chgd.change_request_number as change_request,chgd.row_key as change_request_key,
case when (UPPER(map.dimension_name)='CLOSED' and inc.problem_key not in (0,-1) and prob.opened_on_key>=chg.closed_on_key and
inc.caused_by_change_key<>0 and chg.application_key=prob.application_key) then (inc.incident_key) else null end as problems_for_same_application

from #DWH_TABLE_SCHEMA.f_change_request chg
left join #DWH_TABLE_SCHEMA.d_change_request chgd
on chgd.row_key=chg.change_request_key
left join (select * from #DWH_TABLE_SCHEMA.d_lov where upper(dimension_class)='STATE~CHANGE_REQUEST' and UPPER(dimension_name)='CLOSED')map
on chg.state_src_key=map.row_key
left join #DWH_TABLE_SCHEMA.f_problem inc
on chg.change_request_key=inc.caused_by_change_key
left join #DWH_TABLE_SCHEMA.f_problem prob
on prob.problem_key=inc.problem_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cal.row_key=chg.closed_on_key)problems_within_application
group by problems_within_application.change_request_key)SRC
left join #DWH_TABLE_SCHEMA.d_change_failure chg_failure
on chg_failure.change_request_key=SRC.change_request_key
where SRC.problems_for_same_application<>chg_failure.problems_caused_within_application;



-- using flag from d_problem
select chg_d.row_key,SRC.problems_caused_within_application,TRGT.problems_caused_within_application 
from (select * from #DWH_TABLE_SCHEMA.d_change_request where soft_deleted_flag='N') chg_d
left join 
(select pro_f.application_key,pro_d.caused_by_change_numerify_key,pro_f.source_id,
case when pro_d.caused_by_change_numerify_flag='Y' then count(pro_d.caused_by_change_numerify_flag) else 0 end as problems_caused_within_application 
from #DWH_TABLE_SCHEMA.f_problem pro_f
left join #DWH_TABLE_SCHEMA.d_problem pro_d
on pro_f.problem_key=pro_d.row_key
and pro_f.source_id=pro_d.source_id
where pro_f.soft_deleted_flag='N' and pro_d.soft_deleted_flag='N'
group by 1,2,3)SRC
on chg_d.row_key=SRC.caused_by_change_numerify_key and chg_d.source_id=SRC.source_id
left join (select * from #DWH_TABLE_SCHEMA.d_change_failure where current_flag='Y' and soft_deleted_flag='N')TRGT
on SRC.caused_by_change_numerify_key=TRGT.change_request_key and SRC.source_id=TRGT.source_id and SRC.application_key =TRGT.application_key
where SRC.problems_caused_within_application<>coalesce(TRGT.problems_caused_within_application,0);