select F.outage_key outage_key,
D.short_description Des,
DINC.incident_number,
--'' as metrics,
sum(case when f.outage_key is not null then 1 else 0 end) outages,
sum(case when D.linked_to_incident_flag = 'Y' and f.outage_key is not null
then 1 else 0 end) Linked_to_incident,
sum(case when D.linked_to_incident_flag = 'N' and F.outage_key is not null then 1 else 0 end) 
as Outage_not_Linked_to_incident,
concat(trim(to_char(((sum(case when D.linked_to_incident_flag = 'Y' and F.outage_key is not null then 1 else 0 end)/
sum(case when f.outage_key is not null then 1 else 0 end))*100),'9999999990D9')),'%') Percentage_Linked_INC,
trim(to_char(COALESCE(sum(F.outage_duration::numeric(10,1))/3600, 0),'9999999990D9'  )) Downtime_in_hrs,
trim(to_char(COALESCE((sum(F.outage_duration::numeric(10,1))/3600)/sum(case when outage_key is not null then 1 else 0 end),0),'9999999990D9')) mean_time_to_rstr
from 
(
   select f_outage.*, f_outage_task.task_count tsk_cnt
   FROM #DWH_TABLE_SCHEMA.f_outage
   LEFT JOIN 
   (
    SELECT f_outage_task.outage_key, COALESCE(count(f_outage_task.task_key), 0) AS task_count, COALESCE(count(
        CASE
            WHEN f_outage_task.transaction_type = 'INCIDENT' THEN f_outage_task.incident_key
            ELSE NULL::bigint
        END), 0::bigint) AS incident_count
   FROM #DWH_TABLE_SCHEMA.f_outage_task f_outage_task
   WHERE f_outage_task.soft_deleted_flag = 'N'
   GROUP BY f_outage_task.outage_key
   ) f_outage_task ON f_outage.outage_key = f_outage_task.outage_key
   LEFT JOIN #DWH_TABLE_SCHEMA.f_incident ON f_outage.incident_key = f_incident.incident_key AND f_incident.soft_deleted_flag = 'N'::bpchar
  WHERE f_outage.soft_deleted_flag = 'N'
) F
join #DWH_TABLE_SCHEMA.d_outage D
on F.outage_key = D.row_key
join 
(
   select lov.*, br.dimension_wh_code outage_type_code, wh_lov.dimension_name as outage_type
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'TYPE~OUTAGE'
UNION ALL 
 SELECT lov.*, lov.dimension_code outage_type_code, lov.dimension_name as outage_type
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) outage_type
on outage_type.row_key = D.outage_type_src_key
join #DWH_TABLE_SCHEMA.d_application app
on app.row_key = F.application_key
join 
(
select lov.*, br.dimension_wh_code app_tier_code, wh_lov.dimension_name as app_tier
FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key AND lov.dimension_class = 'TIER~APPLICATION'
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND wh_lov.dimension_class = 'TIER_WH~APPLICATION' AND br.dimension_class = 'TIER~APPLICATION'
UNION ALL 
 SELECT lov.*, 
        CASE
            WHEN lov.dimension_code = 'UNSPECIFIED' THEN 'NO TIER'
            ELSE lov.dimension_code
        END AS app_tier_code, 
        CASE
            WHEN lov.dimension_name = 'UNSPECIFIED' THEN 'NO TIER'
            ELSE lov.dimension_name
        END AS app_tier
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) app_tier
on app_tier.row_key = app.tier_src_key
join
(
   select lov.*, br.dimension_wh_code app_used_for_code, wh_lov.dimension_name as app_used_for
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'USED_FOR~BUSINESS_SERVICE'::text
UNION ALL 
 SELECT lov.*, lov.dimension_code app_used_for_code, lov.dimension_name as app_used_for
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) app_used_for
on app.used_for_src_key = app_used_for.row_key
join 
(
   select d_service.*
   FROM #DWH_TABLE_SCHEMA.d_service
  WHERE d_service.is_business_service_flag = 'Y'::bpchar OR d_service.row_key = 0 OR d_service.row_key = -1
) srvc
on srvc.row_key = F.business_service_key
join
(
   select lov.*, br.dimension_wh_code srvc_criticality_code, wh_lov.dimension_name as srvc_criticality
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'CRITICALITY~BUSINESS_SERVICE'::text
UNION ALL 
 SELECT lov.*, lov.dimension_code srvc_criticality_code, lov.dimension_name as srvc_criticality
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) srvc_criticality
on srvc.criticality_key = srvc_criticality.row_key
join
(
   select lov.*, br.dimension_wh_code srvc_used_for_code, wh_lov.dimension_name as srvc_used_for
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'USED_FOR~BUSINESS_SERVICE'::text
UNION ALL 
 SELECT lov.*, lov.dimension_code srvc_used_for_code, lov.dimension_name as srvc_used_for
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) srvc_used_for
on srvc_used_for.row_key = srvc.used_for_src_key
join 
(
   select d_calendar_date.*
   FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_day ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
)CAL
on CAL.row_key = F.start_on_key
join #DWH_TABLE_SCHEMA.d_configuration_item CI
on CI.row_key = F.configuration_item_key
join #DWH_TABLE_SCHEMA.d_change_request chng_caused_by
on chng_caused_by.row_key = F.caused_by_change_key
left join #DWH_TABLE_SCHEMA.f_incident INC on INC.incident_key = F.incident_key
left join #DWH_TABLE_SCHEMA.d_incident DINC on DINC.row_key = F.incident_key
left join
(
  SELECT lov.*
  FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.dimension_class::text = 'CATEGORY~INCIDENT'::text OR lov.row_key = -1 OR lov.row_key = 0
) CATEGORY
on CATEGORY.row_key = DINC.category_src_key
left join
(
   select lov.*, br.dimension_wh_code contact_type_code, wh_lov.dimension_name as contact_type
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'CONTACT_TYPE~INCIDENT'::text
UNION ALL 
 SELECT lov.*, lov.dimension_code contact_type_code, lov.dimension_name as contact_type
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) CONTACT_TYPE
on CONTACT_TYPE.row_key = INC.reported_type_src_key
left join
(
   select lov.*, br.dimension_wh_code impact_code, wh_lov.dimension_name as impact
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'IMPACT~INCIDENT'::text
UNION ALL 
 SELECT lov.*, lov.dimension_code impact_code, lov.dimension_name as impact
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) impact
on impact.row_key = INC.impact_src_key
left join
(
 SELECT lov.*, br.dimension_wh_code priority_code, wh_lov.dimension_name as priority
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PRIORITY~INCIDENT'
UNION all
 SELECT lov.*, lov.dimension_code priority_code, lov.dimension_name as priority
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) priority
on priority.row_key = INC.priority_src_key
left join
(
 SELECT lov.*, lov.dimension_code subcat_code, lov.dimension_name as subcat
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov parent ON parent.source_id = lov.source_id AND parent.dimension_class::text = 'CATEGORY~INCIDENT'::text AND parent.src_rowid::text = concat(concat('CATEGORY~INCIDENT'::text, '~~~'::text), upper(lov.dimension_type::text))
  WHERE lov.dimension_class::text = 'SUBCATEGORY~INCIDENT'::text
UNION all
 SELECT lov.*, lov.dimension_code subcat_code, lov.dimension_name as subcat
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) SUBCATEGORY
on SUBCATEGORY.row_key = DINC.sub_category_src_key
left join
(
 SELECT lov.*, br.dimension_wh_code urgency_code, wh_lov.dimension_name as urgency
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'URGENCY~INCIDENT'
UNION all
 SELECT lov.*, lov.dimension_code urgency_code, lov.dimension_name as urgency
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) urgency
on urgency.row_key = INC.urgency_src_key
left join #DWH_TABLE_SCHEMA.d_configuration_item INCCI
on INC.configuration_item_key = INCCI.row_key
left join #DWH_TABLE_SCHEMA.d_internal_contact IC
on IC.row_key = INC.assigned_to_key
left join
(
  select d_internal_organization.*
  FROM #DWH_TABLE_SCHEMA.d_internal_organization
  WHERE d_internal_organization.group_flag = 'Y'::bpchar OR d_internal_organization.row_key = 0 OR d_internal_organization.row_key = -1
) ORG
on ORG.row_key = chng_caused_by.assignment_group_key
where CAL.lagging_count_of_month between 0 and 12
and CAL.calendar_code = 0
group by outage_key, D.short_description, DINC.incident_number
order by outage_key, D.short_description, DINC.incident_number