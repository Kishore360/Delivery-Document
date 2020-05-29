select D.case_number, 
D.short_description, 
D.knowledge_flag, 
casecategory.dimension_name cat, 
subcategory.dimension_name subcat, 
CNT.full_name asn_to, 
GRP.organization_name asn_grp,
lov_state.dimension_name state, 
lov_app.dimension_name approval, 
lov_impact.dimension_name impact,
lov_priority.dimension_name priority, 
lov_urgency.dimension_name urgency, 
chn.dimension_wh_code channel,
COMP.organization_name company, 
TO_CHAR((D.changed_on),'fmMM/fmDD/YYYY fmHH:MI:SS AM') updated_on, 
case when count(case when state.dimension_wh_code = 'OPEN' then F.case_key else null end) = 0 then null
else (sum(F.dormancy_age)/count(case when state.dimension_wh_code = 'OPEN' then F.case_key else null end)) end avg_days_since_update
from #DWH_TABLE_SCHEMA.f_case F
join #DWH_TABLE_SCHEMA.d_case D
on F.case_key = D.row_key and D.source_id = F.source_id
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on CAL.row_key = F.opened_on_key
join #DWH_TABLE_SCHEMA.d_lov_map state 
ON F.state_src_key = state.src_key and state.dimension_class = 'STATE~CASE'
join #DWH_TABLE_SCHEMA.d_service_contract dsc
on dsc.row_key = F.service_contract_key
join #DWH_TABLE_SCHEMA.d_internal_contact CNT 
ON F.assigned_to_key = CNT.row_key
join #DWH_TABLE_SCHEMA.d_internal_organization GRP
ON F.assignment_group_key = GRP.row_key
join #DWH_TABLE_SCHEMA.d_lov_map chn 
ON D.reported_type_src_key = chn.src_key and chn.dimension_class = 'REPORTED_TYPE~CASE'
join #DWH_TABLE_SCHEMA.d_internal_organization COMP
ON F.company_key = COMP.row_key
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
group by D.case_number, 
D.short_description, D.knowledge_flag, 
cat, subcat, asn_to, asn_grp,
state, approval, impact,
priority, urgency, channel,
company, updated_on
order by D.case_number, 
D.short_description, D.knowledge_flag, 
cat, subcat, asn_to, asn_grp,
state, approval, impact,
priority, urgency, channel,
company, updated_on