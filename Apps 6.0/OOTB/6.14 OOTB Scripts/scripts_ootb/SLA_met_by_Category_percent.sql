select 
D.sla_name name,
sla_cat_name.wh_dimension_name sla_cat_details,
concat(round(cast(sum(case when F.outcome_flag='N' and F.exclude_flag='N' then 1 else 0 end ) as numeric)
/count(distinct F.row_key)::numeric*100,1),'%') sla_met_prct,

case when count(distinct case when sla_cat_name.wh_dimension_name = 'Resolution' 
and sla_stage.sla_stage_code not in ('CANCELLED') and F.exclude_flag='N' then F.row_key else null end) = 0 then null

else concat(cast(round((sum(case when F.outcome_flag='N' and sla_cat_name.wh_dimension_name = 'Resolution' 
and sla_stage.sla_stage_code not in ('CANCELLED') and F.exclude_flag='N' then 1.0000 else 0.0000 end)/
count(distinct case when sla_cat_name.wh_dimension_name = 'Resolution' 
and sla_stage.sla_stage_code not in ('CANCELLED') and F.exclude_flag='N' then F.row_key else null end)*1.0000)*100.0000,1) as varchar),'%') end sla_met_prct_res,

case when count(distinct case when sla_cat_name.wh_dimension_name = 'Response' 
and sla_stage.sla_stage_code not in ('CANCELLED') and F.exclude_flag='N' then F.row_key else null end) = 0 then null

else concat(cast(round((sum(case when F.outcome_flag='N' and sla_cat_name.wh_dimension_name = 'Response' 
and sla_stage.sla_stage_code not in ('CANCELLED') and F.exclude_flag='N' then 1.0000 else 0.0000 end)/
count(distinct case when sla_cat_name.wh_dimension_name = 'Response' 
and sla_stage.sla_stage_code not in ('CANCELLED') and F.exclude_flag='N' then F.row_key else null end)*1.0000)*100.0000,1) as varchar),'%') end sla_met_prct_resp

from 
(
   select f_task_sla.*, f_incident.opened_on_key opened_on_key, f_incident.last_resolved_on_key last_resolved_on_key, f_incident.assignment_group_key assignment_group_key
   FROM #DWH_TABLE_SCHEMA.f_task_sla f_task_sla
   JOIN #DWH_TABLE_SCHEMA.f_incident f_incident ON f_task_sla.incident_key = f_incident.incident_key AND f_incident.soft_deleted_flag = 'N'::bpchar AND f_task_sla.soft_deleted_flag = 'N'::bpchar
  WHERE f_task_sla.task_type = 'INCIDENT'
) F
join #DWH_TABLE_SCHEMA.d_incident DINC
on DINC.row_key = F.incident_key
join #DWH_TABLE_SCHEMA.d_task_sla D
on D.row_key = F.sla_key
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
on CAL.row_key = F.opened_on_key
join 
(
 SELECT d_calendar_date.*
   FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
  WHERE d_calendar_date.month_start_date_key = d_calendar_date.row_key AND d_calendar_date.source_id = 0
) cal_mon
	  on 	(CAL.month_start_date_key = cal_mon.row_key)
join
(
 SELECT lov.*, br.dimension_wh_code priority_code, wh_lov.dimension_name as priority
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PRIORITY~INCIDENT'
UNION 
 SELECT lov.*, lov.dimension_code priority_code, lov.dimension_name as priority
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) priority
on priority.row_key = DINC.priority_src_key
join 
(
   select iog.*
   FROM #DWH_TABLE_SCHEMA.d_internal_organization iog
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON iog.manager_key = icm.row_key
  WHERE iog.group_flag = 'Y' OR iog.row_key = 0 OR iog.row_key = -1
) ORG
on ORG.row_key = F.assignment_group_key
join
(
 SELECT COALESCE(wh_lov.dimension_code, sla_category.dimension_code) AS wh_dimension_code, 
 COALESCE(wh_lov.row_id, sla_category.row_id) AS wh_row_id, 
 COALESCE(wh_lov.dimension_name, sla_category.dimension_name) AS wh_dimension_name, 
 sla_category.dimension_code AS source_dimension_code, sla_category.dimension_name AS source_dimension_name, 
 sla_category.effective_to, sla_category.created_by, sla_category.row_key, sla_category.etl_run_number, 
 sla_category.effective_from, sla_category.row_id, sla_category.secondary1_changed_on, sla_category.secondary2_changed_on, 
 sla_category.created_on, sla_category.soft_deleted_flag, sla_category.current_flag, sla_category.row_dn_key, 
 sla_category.changed_on, sla_category.cdctype, sla_category.row_current_key, sla_category.dw_updated_on, 
 sla_category.source_id, sla_category.changed_by, sla_category.dw_inserted_on
   FROM #DWH_TABLE_SCHEMA.d_lov sla_category
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON sla_category.row_key = br.src_key AND sla_category.row_key <> -1 
   AND sla_category.row_key <> 0
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON br.wh_key = wh_lov.row_key
  WHERE sla_category.row_key = -1 OR sla_category.row_key = 0 OR sla_category.dimension_class::text = 'NAME~TASK_SLA'
) sla_cat_name
on sla_cat_name.row_key = D.sla_category_key
join
(
   select lov.*, br.dimension_wh_code as sla_stage_code, wh_lov.dimension_name sla_stage
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STAGE~TASK_SLA'
UNION 
 SELECT lov.*, lov.dimension_code as sla_stage_code, lov.dimension_name sla_stage
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) sla_stage
on sla_stage.row_key = F.stage_src_key
join
(
 SELECT dh_all_hierarchies_dimension.lev_5_key, dh_user_group_level2_bi.organization_name AS lev_2_organization_name, assignment_group.organization_name, dh_user_group_level3_bi.organization_name AS lev_3_organization_name, dh_all_hierarchies_dimension.lev_4_key, dh_user_group_level5_bi.organization_name AS lev_5_organization_name, dh_user_group_level4_bi.organization_name AS lev_4_organization_name, dh_all_hierarchies_dimension.lev_2_key, dh_all_hierarchies_dimension.lev_0_key, assignment_group.emp_count, dh_user_group_level1_bi.organization_name AS lev_1_organization_name, dh_all_hierarchies_dimension.lev_1_key, dh_all_hierarchies_dimension.lev_3_key, fco_d_internal_contact.full_name AS manager, assignment_group.soft_deleted_flag, assignment_group.row_current_key, assignment_group.changed_by, assignment_group.dw_updated_on, assignment_group.changed_on, assignment_group.current_flag, assignment_group.source_id, assignment_group.secondary2_changed_on, assignment_group.effective_from, assignment_group.created_by, assignment_group.row_dn_key, assignment_group.location_key, assignment_group.secondary1_changed_on, assignment_group.cdctype, assignment_group.effective_to, assignment_group.created_on, assignment_group.row_id, assignment_group.etl_run_number, assignment_group.row_key, assignment_group.dw_inserted_on
   FROM #DWH_TABLE_SCHEMA.d_internal_organization assignment_group
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact fco_d_internal_contact ON assignment_group.manager_key = fco_d_internal_contact.row_key
   JOIN #DWH_TABLE_SCHEMA.d_h_all_hierarchies dh_all_hierarchies_dimension ON assignment_group.row_dn_key = dh_all_hierarchies_dimension.lev_0_key AND (dh_all_hierarchies_dimension.hierarchy_class::text = 'USER GROUP'::text OR dh_all_hierarchies_dimension.hierarchy_class::text = 'UNSPECIFIED'::text OR dh_all_hierarchies_dimension.hierarchy_class::text = 'UNKNOWN'::text) AND dh_all_hierarchies_dimension.current_flag = 'Y'::bpchar
   JOIN #DWH_TABLE_SCHEMA.d_internal_organization dh_user_group_level1_bi ON dh_all_hierarchies_dimension.lev_1_key = dh_user_group_level1_bi.row_key AND dh_user_group_level1_bi.group_flag = 'Y'::bpchar AND dh_user_group_level1_bi.current_flag = 'Y'::bpchar
   JOIN #DWH_TABLE_SCHEMA.d_internal_organization dh_user_group_level2_bi ON dh_all_hierarchies_dimension.lev_2_key = dh_user_group_level2_bi.row_key AND dh_user_group_level2_bi.group_flag = 'Y'::bpchar AND dh_user_group_level2_bi.current_flag = 'Y'::bpchar
   JOIN #DWH_TABLE_SCHEMA.d_internal_organization dh_user_group_level3_bi ON dh_all_hierarchies_dimension.lev_3_key = dh_user_group_level3_bi.row_key AND dh_user_group_level3_bi.group_flag = 'Y'::bpchar AND dh_user_group_level3_bi.current_flag = 'Y'::bpchar
   JOIN #DWH_TABLE_SCHEMA.d_internal_organization dh_user_group_level4_bi ON dh_all_hierarchies_dimension.lev_4_key = dh_user_group_level4_bi.row_key AND dh_user_group_level4_bi.group_flag = 'Y'::bpchar AND dh_user_group_level4_bi.current_flag = 'Y'::bpchar
   JOIN #DWH_TABLE_SCHEMA.d_internal_organization dh_user_group_level5_bi ON dh_all_hierarchies_dimension.lev_5_key = dh_user_group_level5_bi.row_key AND dh_user_group_level5_bi.group_flag = 'Y'::bpchar AND dh_user_group_level5_bi.current_flag = 'Y'::bpchar
  WHERE assignment_group.group_flag = 'Y'::bpchar OR assignment_group.row_key = 0 OR assignment_group.row_key = -1
 ) DIO
on DIO.row_key = F.assignment_group_key
where cal_mon.lagging_count_of_month between 0 and 12

group by name, D.row_key, sla_cat_details
order by name, D.row_key, sla_cat_details