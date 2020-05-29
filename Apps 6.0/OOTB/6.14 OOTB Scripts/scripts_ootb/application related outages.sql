select coalesce(APP.name, '') APP_NAME,
app_tier.app_tier APP_TIER_NAME,
coalesce(APP.version, '') APP_VER,
app_used_for.dimension_name APP_USED_FOR_NAME,
trim(to_char(sum(case when F.outage_key not in (0,-1) then 1 else 0 end), '9,999,999,990')) Outages,
trim(to_char(sum(case when F.application_key not in (0,-1) and F.outage_key is not null then 1 else 0 end), '9,999,999,990')) Outage_for_Application,
trim(to_char(sum(F.updates_count), '9,999,999,990')) Updates_count
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
where CAL.lagging_count_of_month between 0 and 12
group by APP.name, APP_TIER_NAME, APP_USED_FOR_NAME, APP.version
order by upper(APP.name), APP_TIER_NAME, APP_USED_FOR_NAME, APP.version