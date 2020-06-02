select D.case_number case_no,  
to_char(F.opened_on, 'fmMM/fmDD/YYYY fmHH:MI:SS AM') opened,
to_char(F.last_resolved_on, 'fmMM/fmDD/YYYY fmHH:MI:SS AM') lastresolved, 
to_char(F.closed_on, 'fmMM/fmDD/YYYY fmHH:MI:SS AM') closed, 
coalesce(sum(round(F.open_to_close_duration/86400.00,0)),0) open_to_close,
case when sum(case when lov_state.state_name = 'CLOSED' THEN 1 ELSE 0 END) = 0 then null
else round(sum(F.open_to_close_duration/86400.00)/sum(case when lov_state.state_name = 'CLOSED' THEN 1 ELSE 0 END),0) end MTTC,
case when sum(case when lov_state.state_name in ('RESOLVED', 'CLOSED') THEN 1 ELSE 0 END) = 0 then null
when max(F.last_resolved_on) is null then 0
else round(sum(F.open_to_resolve_duration/86400.00)/sum(case when lov_state.state_name in ('RESOLVED', 'CLOSED') THEN 1 ELSE 0 END),0) end MTTR
from #DWH_TABLE_SCHEMA.f_case F
join #DWH_TABLE_SCHEMA.d_case D
on F.case_key = D.row_key and D.source_id = F.source_id
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on CAL.row_key = F.opened_on_key
join 
(
select d_service.*
FROM #DWH_TABLE_SCHEMA.d_service d_service
  WHERE d_service.is_business_service_flag = 'Y'::bpchar OR d_service.row_key = 0 OR d_service.row_key = -1) SRVC
on SRVC.row_key = F.business_service_key
join 
(SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'CRITICALITY~BUSINESS_SERVICE'::text
UNION ALL 
 SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0) crit 
ON SRVC.criticality_key = crit.row_key
join 
(SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'USED_FOR~BUSINESS_SERVICE'::text
UNION ALL 
 SELECT lov.*
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0) used 
ON SRVC.used_for_src_key = used.row_key
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

join  (       SELECT  lov.*, br.dimension_wh_code state_name FROM #DWH_TABLE_SCHEMA.d_lov lov

              LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key

              JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key

              AND br.dimension_class::text = 'STATE~CASE'::text

              UNION

              SELECT lov.*, lov.dimension_name state_name FROM #DWH_TABLE_SCHEMA.d_lov lov

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
group by case_no, opened, lastresolved, closed
order by case_no, opened, lastresolved, closed
--limit 20