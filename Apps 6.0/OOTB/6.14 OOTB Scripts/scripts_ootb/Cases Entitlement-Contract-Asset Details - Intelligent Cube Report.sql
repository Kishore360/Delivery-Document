select D.case_number case_no, 
ENT.entitlement_name ent_name, 
CNTR.contract_number cntrct_num, 
CNT.full_name name, 
ASSET.display_name asset_name, 
PROD.model_name prod_name, 
PARTNER.organization_name partner_name,
count(case when CNTR_STATE.dimension_name = 'Expired' and F.case_key is not null then F.case_key else null end) no_open_cases_for_expired_contract
from #DWH_TABLE_SCHEMA.f_case F
join #DWH_TABLE_SCHEMA.d_case D
on F.case_key = D.row_key and D.source_id = F.source_id
join #DWH_TABLE_SCHEMA.d_service_entitlement ENT
on ENT.row_key = F.service_entitlement_key
join #DWH_TABLE_SCHEMA.d_service_contract CNTR
on CNTR.row_key = F.service_contract_key
join  
(
SELECT lov.*
FROM #DWH_TABLE_SCHEMA.d_lov lov
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~SERVICE_CONTRACT'
UNION ALL 
SELECT lov.*
FROM #DWH_TABLE_SCHEMA.d_lov lov
WHERE lov.row_key = -1 OR lov.row_key = 0
) CNTR_STATE
on CNTR_STATE.row_key = CNTR.state_src_key
join #DWH_TABLE_SCHEMA.d_contact CNT
on CNT.row_key = F.contact_key
join #DWH_TABLE_SCHEMA.d_asset ASSET
on ASSET.row_key = F.asset_key
join #DWH_TABLE_SCHEMA.d_product_model PROD
on PROD.row_key = F.product_model_key
join #DWH_TABLE_SCHEMA.d_organization_customer PARTNER
on PARTNER.row_key = F.partner_key
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on CAL.row_key = F.opened_on_key
join #DWH_TABLE_SCHEMA.d_lov_map state 
ON F.state_src_key = state.src_key and state.dimension_class = 'STATE~CASE'
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
group by case_no, ent_name, cntrct_num, name, asset_name, 
prod_name, partner_name
order by case_no, ent_name, cntrct_num, name, asset_name, 
prod_name, partner_name
--limit 20