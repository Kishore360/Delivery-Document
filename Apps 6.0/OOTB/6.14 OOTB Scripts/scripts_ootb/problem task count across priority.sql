select priority.dimension_name pr,

count(distinct case when F.problem_task_key is not null then F.problem_task_key else null end) opened_pt,

count(distinct case when F.problem_task_key is not null and D.over_due_flag = 'Y' then F.problem_task_key else null end) overdue_pt,

count(distinct case when F.problem_task_key is not null and state.state in ('CLOSED', 'RESOLVED') then F.problem_task_key else null end) closed_pt,

count(distinct case when F.problem_task_key is not null and D.backlog_flag = 'Y' then F.problem_task_key else null end) backlog_pt

from #DWH_TABLE_SCHEMA.f_problem_task F
join #DWH_TABLE_SCHEMA.d_problem_task D
on F.problem_task_key = D.row_key
join #DWH_TABLE_SCHEMA.d_problem DPROB
on DPROB.row_key = F.problem_key
join #DWH_TABLE_SCHEMA.f_problem FPROB
on FPROB.problem_key = F.problem_key
join 
(
 SELECT lov.*, wh_lov.dimension_code AS priority_code, wh_lov.dimension_name AS priority
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'PRIORITY~PROBLEM_TASK'::text
UNION 
 SELECT lov.*, lov.dimension_code AS priority_code, lov.dimension_name AS priority
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) priority
on F.priority_src_key = priority.row_key
join 
(
 SELECT lov.*, wh_lov.dimension_code AS impact_code, wh_lov.dimension_name AS impact
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'IMPACT~PROBLEM_TASK'::text
UNION 
 SELECT lov.*, lov.dimension_code AS impact_code, lov.dimension_name AS impact
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) impact
on F.impact_src_key = impact.row_key
join  
(
 SELECT lov.*, wh_lov.dimension_code AS state_code, wh_lov.dimension_name AS state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'STATE~PROBLEM_TASK'::text
UNION 
 SELECT lov.*, lov.dimension_code AS state_code, lov.dimension_name AS state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) state
on F.state_src_key = state.row_key
join  
(
 SELECT lov.*, wh_lov.dimension_code AS approval_code, wh_lov.dimension_name AS approval
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'APPROVAL~PROBLEM_TASK'::text
UNION 
 SELECT lov.*, lov.dimension_code AS approval_code, lov.dimension_name AS approval
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) approval
on F.approval_src_key = approval.row_key
join  
(
 SELECT lov.*, wh_lov.dimension_code AS reported_type_code, wh_lov.dimension_name AS reported_type
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'CONTACT_TYPE~PROBLEM_TASK'::text
UNION 
 SELECT lov.*, lov.dimension_code AS reported_type_code, lov.dimension_name AS reported_type
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) reported_type
on F.reported_type_src_key = reported_type.row_key
join  
(
 SELECT lov.*, wh_lov.dimension_code AS urgency_code, wh_lov.dimension_name AS urgency
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'URGENCY~PROBLEM_TASK'::text
UNION 
 SELECT lov.*, lov.dimension_code AS urgency_code, lov.dimension_name AS urgency
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) urgency
on F.urgency_src_key = urgency.row_key
join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cal.row_key = (case when state.state = 'CLOSED' then F.closed_on_key else F.opened_on_key end)
join #DWH_TABLE_SCHEMA.d_application app
on app.row_key = F.application_key
join #DWH_TABLE_SCHEMA.d_service srvc
on F.business_service_key = srvc.row_key
join #DWH_TABLE_SCHEMA.d_configuration_item ci
on ci.row_key = F.configuration_item_key
join #DWH_TABLE_SCHEMA.d_internal_contact DIC
on DIC.row_key = (case when state.state = 'CLOSED' then F.closed_by_key else F.opened_by_key end)
left join #DWH_TABLE_SCHEMA.d_internal_contact DIC_open
on DIC.row_key = F.opened_by_key
left join #DWH_TABLE_SCHEMA.d_internal_contact DIC_close
on DIC.row_key = F.closed_by_key
join
(
   select iog.*
   FROM #DWH_TABLE_SCHEMA.d_internal_organization iog
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON iog.manager_key = icm.row_key
  WHERE iog.group_flag = 'Y'::bpchar OR iog.row_key = 0 OR iog.row_key = -1
) org
on org.row_key = F.assignment_group_key
join #DWH_TABLE_SCHEMA.d_location loc
on loc.row_key = F.location_key
where (cal.lagging_count_of_month between 0 and 12 or D.backlog_flag = 'Y')
and F.soft_deleted_flag = 'N' and FPROB.soft_deleted_flag = 'N'
group by pr
order by pr