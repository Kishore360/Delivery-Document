select comp.organization_name comp_name, 

D.multiple_assignment_flag multiple_assignment_flag,

count (case when F.case_key is not null and D.overall_sla_outcome_flag = 'Y' and D.multiple_assignment_flag = 'Y' then F.case_key else null end) mul_asgn_met_all_sla,

count (case when F.case_key is not null and D.overall_sla_outcome_flag = 'N' and D.multiple_assignment_flag = 'Y' then F.case_key else null end) mul_asgn_missed_any_sla,

case when count (case when closed.closed_case is not null then F.case_key else null end) = 0 then null
else concat(round((count (case when closed.closed_case is not null and D.overall_sla_outcome_flag = 'Y' then F.case_key else null end)*100.00)/
count (case when closed.closed_case is not null then F.case_key else null end), 0), '%') end closed_cases_met_all_sla_prct,

case when count (case when resolved.resolved_case is not null then F.case_key else null end) = 0 then null
else concat(round((count (case when resolved.resolved_case is not null and D.overall_sla_outcome_flag = 'Y' then F.case_key else null end)*100.00)/
count (case when resolved.resolved_case is not null then F.case_key else null end), 0), '%') end resolved_cases_met_all_sla_prct,

count (case when resolved.resolved_case is not null and D.overall_sla_outcome_flag = 'N' then F.case_key else null end) resolved_cases_missed_any_sla,

concat(round(case when count (case when F.case_key is not null then F.case_key else null end) = 0 then null
else (count (case when F.case_key is not null and D.overall_sla_outcome_flag = 'N' then F.case_key else null end)* 100.00 /
count (case when F.case_key is not null then F.case_key else null end)) end,0), '%') SLA_missed_sla_prct

from #DWH_TABLE_SCHEMA.f_case F
left join 
(
select f_case.case_key resolved_case
from #DWH_TABLE_SCHEMA.f_case f_case
JOIN #DWH_TABLE_SCHEMA.d_case d_case ON d_case.source_id = f_case.source_id AND d_case.row_key = f_case.case_key
JOIN #DWH_TABLE_SCHEMA.d_lov_map a12 ON d_case.state_src_key = a12.src_key
join #DWH_TABLE_SCHEMA.d_calendar_date res_CAL
on res_CAL.row_key = f_case.last_resolved_on_key
WHERE (a12.dimension_wh_code = 'RESOLVED' OR a12.dimension_wh_code = 'CLOSED') AND f_case.soft_deleted_flag = 'N' and res_CAL.lagging_count_of_month between 0 and 12
) resolved
on resolved.resolved_case = F.case_key
left join 
(
select f_case.case_key closed_case
from #DWH_TABLE_SCHEMA.f_case f_case
JOIN #DWH_TABLE_SCHEMA.d_case d_case ON d_case.source_id = f_case.source_id AND d_case.row_key = f_case.case_key
JOIN #DWH_TABLE_SCHEMA.d_lov_map a12 ON d_case.state_src_key = a12.src_key
join #DWH_TABLE_SCHEMA.d_calendar_date close_CAL
on close_CAL.row_key = f_case.closed_on_key
WHERE (a12.dimension_wh_code = 'CLOSED') AND f_case.soft_deleted_flag = 'N' and close_CAL.lagging_count_of_month between 0 and 12
) closed
on closed.closed_case = F.case_key
join #DWH_TABLE_SCHEMA.d_case D
on F.case_key = D.row_key and D.source_id = F.source_id
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on CAL.row_key = F.opened_on_key
join #DWH_TABLE_SCHEMA.d_configuration_item CI
on F.configuration_item_key = CI.row_key
join #DWH_TABLE_SCHEMA.d_lov_map state 
ON D.state_src_key = state.src_key and state.dimension_class = 'STATE~CASE'
join #DWH_TABLE_SCHEMA.d_lov WH_LOV
on WH_LOV.row_key = state.wh_key
join #DWH_TABLE_SCHEMA.d_internal_contact CNT 
ON F.assigned_to_key = CNT.row_key
join #DWH_TABLE_SCHEMA.d_internal_organization GRP
ON F.assignment_group_key = GRP.row_key
join #DWH_TABLE_SCHEMA.d_internal_organization COMP
ON F.company_key = COMP.row_key
left join #DWH_TABLE_SCHEMA.d_organization_customer CUST
on F.customer_account_key = CUST.row_key
join #DWH_TABLE_SCHEMA.d_service_contract dsc
on dsc.row_key = F.service_contract_key
join ( SELECT  lov.*   FROM #DWH_TABLE_SCHEMA.d_lov lov

              LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key

              JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key

              AND br.dimension_class::text = 'STATE~SERVICE_CONTRACT'::text

              UNION

              SELECT lov.* FROM #DWH_TABLE_SCHEMA.d_lov lov

              WHERE lov.row_key = -1 OR lov.row_key = 0

              ) lov_dsc_state

on dsc.state_src_key=lov_dsc_state.row_key

 

join #DWH_TABLE_SCHEMA.d_service_entitlement dse

on dse.row_key = F.service_entitlement_key

        

-- Case Approval

join  (       SELECT  lov.*   FROM #DWH_TABLE_SCHEMA.d_lov lov

              WHERE lov.dimension_class = 'APPROVAL~CASE' OR lov.row_key IN (-1,0)

              ) lov_app

on D.approval_state_src_key=lov_app.row_key

 

-- Case Category

join  (         SELECT lov.* FROM  #DWH_TABLE_SCHEMA.d_lov lov

               WHERE lov.dimension_class::text = 'CATEGORY~CASE'::text OR lov.row_key = -1 OR lov.row_key = 0

              ) casecategory

on D.category_src_key=casecategory.row_key

 

-- Case Impact

join  (       SELECT  lov.*   FROM #DWH_TABLE_SCHEMA.d_lov lov

              LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key

              JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key

              AND br.dimension_class::text = 'IMPACT~CASE'::text

              UNION

              SELECT lov.* FROM #DWH_TABLE_SCHEMA.d_lov lov

              WHERE lov.row_key = -1 OR lov.row_key = 0

              ) lov_impact

on D.impact_src_key=lov_impact.row_key

 

-- Case Priority

join  (       SELECT  lov.*   FROM #DWH_TABLE_SCHEMA.d_lov lov

              LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key

              JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key

              AND br.dimension_class::text = 'PRIORITY~CASE'::text

              UNION

              SELECT lov.* FROM #DWH_TABLE_SCHEMA.d_lov lov

              WHERE lov.row_key = -1 OR lov.row_key = 0

              ) lov_priority

on D.priority_src_key=lov_priority.row_key

 

-- Case Overall SLA Flag

join  (         SELECT lov.* FROM  #DWH_TABLE_SCHEMA.d_lov lov

               WHERE lov.dimension_class::text = 'WH_SLA_FLAG~TASK_SLA'::text OR lov.row_key = -1 OR lov.row_key = 0

              ) caseoverallslaflag

on D.overall_sla_outcome_flag_key=caseoverallslaflag.row_key

 

-- Case State

join  (       SELECT  lov.*   FROM #DWH_TABLE_SCHEMA.d_lov lov

              LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key

              JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key

              AND br.dimension_class::text = 'STATE~CASE'::text

              UNION

              SELECT lov.* FROM #DWH_TABLE_SCHEMA.d_lov lov

              WHERE lov.row_key = -1 OR lov.row_key = 0

              ) lov_state

on D.state_src_key=lov_state.row_key

 

-- Case Sub Category

join  (         SELECT lov.* FROM  #DWH_TABLE_SCHEMA.d_lov lov

               WHERE lov.dimension_class::text = 'SUBCATEGORY~CASE'::text OR lov.row_key = -1 OR lov.row_key = 0

              ) subcategory

on D.sub_category_src_key=subcategory.row_key

 

-- Case Urgency

join  (       SELECT  lov.*   FROM #DWH_TABLE_SCHEMA.d_lov lov

              LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key

              JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key

              AND br.dimension_class::text = 'URGENCY~CASE'::text

              UNION

              SELECT lov.* FROM #DWH_TABLE_SCHEMA.d_lov lov

              WHERE lov.row_key = -1 OR lov.row_key = 0

              ) lov_urgency

on D.urgency_src_key=lov_urgency.row_key

 

-- Case Reported Type

join  (       SELECT  lov.*   FROM #DWH_TABLE_SCHEMA.d_lov lov

              LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key

              JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key

              AND br.dimension_class::text = 'REPORTED_TYPE~CASE'::text

              UNION

              SELECT lov.* FROM #DWH_TABLE_SCHEMA.d_lov lov

              WHERE lov.row_key = -1 OR lov.row_key = 0

              ) lov_reptype

on D.reported_type_src_key=lov_reptype.row_key

 

-- Case SLA Response

join  (         SELECT lov.* FROM  #DWH_TABLE_SCHEMA.d_lov lov

               WHERE lov.dimension_class::text = 'WH_SLA_FLAG~TASK_SLA'::text OR lov.row_key = -1 OR lov.row_key = 0

              ) caseresponseslaflag

on D.met_response_sla_flag_key=caseresponseslaflag.row_key

 

-- Case SLA Resolution

join  (         SELECT lov.* FROM  #DWH_TABLE_SCHEMA.d_lov lov

               WHERE lov.dimension_class::text = 'WH_SLA_FLAG~TASK_SLA'::text OR lov.row_key = -1 OR lov.row_key = 0

              ) caseresolutionslaflag

on D.met_resolution_sla_flag_key=caseresolutionslaflag.row_key
where CAL.lagging_count_of_month between 0 and 12
and F.soft_deleted_flag = 'N'
group by comp_name, multiple_assignment_flag
order by upper(comp.organization_name), multiple_assignment_flag
