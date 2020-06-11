select asgn_grp.organization_name asgn_grp_name,
priority.dimension_name pr,

count(case when CAL.lagging_count_of_days between 0 and 29 and F.incident_key is not null then F.incident_key else null end) opnd_inc,

count(case when CAL.lagging_count_of_days between 0 and 29 and state.state in ('RESOLVED', 'CLOSED') and F.incident_key is not null then F.incident_key else null end) rslvd_inc,

case when sum(case when CAL.lagging_count_of_days between 0 and 29 then asgn_grp.emp_count else null end) = 0 then 0 
when sum(case when CAL.lagging_count_of_days between 0 and 29 then asgn_grp.emp_count else null end) is null then 0 
else count(case when CAL.lagging_count_of_days between 0 and 29 and F.incident_key is not null then F.incident_key else null end)/
sum(case when CAL.lagging_count_of_days between 0 and 29 then asgn_grp.emp_count else null end) end opnd_inc_ratio,

round(case when count(case when CAL.lagging_count_of_days between 0 and 29 and state.state in ('RESOLVED', 'CLOSED') and F.incident_key is not null then F.incident_key else null end) = 0 then 0 else
(sum(case when CAL.lagging_count_of_days between 0 and 29 then F.open_to_resolve_duration else null end * 1.00)/86400)/count(case when CAL.lagging_count_of_days between 0 and 29 and state.state in ('RESOLVED', 'CLOSED') and F.incident_key is not null then F.incident_key else null end) end, 1) MTTR,

concat(cast(round(case when count(case when CAL.lagging_count_of_days between 0 and 29 and F.incident_key is not null then F.incident_key else null end) = 0 then 0 else 
count(case when CAL.lagging_count_of_days between 0 and 29 and state.state in ('RESOLVED', 'CLOSED') and F.incident_key is not null then F.incident_key else null end) * 100.00/count(case when CAL.lagging_count_of_days between 0 and 29 and F.incident_key is not null then F.incident_key else null end) end, 0) as varchar),'%') inc_fix_rate,

concat(cast(round(case when count(case when CAL.lagging_count_of_days between 0 and 29 and F.incident_key is not null then F.incident_key else null end) = 0 then null else 
count(case when CAL.lagging_count_of_days between 0 and 29 and D.backlog_flag = 'Y' and F.incident_key is not null then F.incident_key else null end) * 100.00/count(case when CAL.lagging_count_of_days between 0 and 29 and F.incident_key is not null then F.incident_key else null end) end, 0) as varchar),'%') inc_bcklg_prct,

case when (count(case when CAL.lagging_count_of_days between 0 and 29 and F.incident_key is not null then F.incident_key else null end) - count(case when CAL.lagging_count_of_days between 0 and 29 and F.assigned_to_key in (0,-1) then F.incident_number else null end)) = 0 then null
when count(case when CAL.lagging_count_of_days between 0 and 29 and F.incident_key is not null then F.incident_key else null end) = 0 then round(0, 0)
else round(count(case when CAL.lagging_count_of_days between 0 and 29 and D.backlog_flag = 'Y' and F.incident_key is not null then F.incident_key else null end) * 100.00/
(count(case when CAL.lagging_count_of_days between 0 and 29 and F.incident_key is not null then F.incident_key else null end) - count(case when CAL.lagging_count_of_days between 0 and 29 and F.assigned_to_key in (0,-1) then F.incident_number else null end)), 0) end inc_bcklg_asgnd_prct

FROM #DWH_TABLE_SCHEMA.f_incident F
join #DWH_TABLE_SCHEMA.d_incident D
on F.incident_key = D.row_key and F.soft_deleted_flag = 'N'
join
(
 SELECT lov.*, br.dimension_wh_code state_code, wh_lov.dimension_name as state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~INCIDENT'
UNION all
 SELECT lov.*, lov.dimension_code state_code, lov.dimension_name as state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) state
on state.row_key = F.state_src_key
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
on CAL.row_key = case when state.state in ('CLOSED', 'RESOLVED') then F.last_resolved_on_key else F.opened_on_key end
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
  SELECT lov.*
  FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.dimension_class = 'CATEGORY~INCIDENT' OR lov.row_key = -1 OR lov.row_key = 0
) CATEGORY
on CATEGORY.row_key = D.category_src_key
join
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
on CONTACT_TYPE.row_key = F.reported_type_src_key
join
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
on priority.row_key = F.priority_src_key
join
(
 SELECT lov.*, lov.dimension_code subcat_code, lov.dimension_name as subcat
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov parent ON parent.source_id = lov.source_id 
   AND parent.dimension_class = 'CATEGORY~INCIDENT' 
   AND parent.src_rowid::text = concat(concat('CATEGORY~INCIDENT'::text, '~~~'::text), upper(lov.dimension_type::text))
  WHERE lov.dimension_class = 'SUBCATEGORY~INCIDENT'
UNION all
 SELECT lov.*, lov.dimension_code subcat_code, lov.dimension_name as subcat
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) SUBCATEGORY
on SUBCATEGORY.row_key = D.sub_category_src_key
left join #DWH_TABLE_SCHEMA.d_internal_contact rslvd_by_IC
on rslvd_by_IC.row_key = F.last_resolved_by_key
left join #DWH_TABLE_SCHEMA.d_internal_contact opnd_by_IC
on opnd_by_IC.row_key = F.opened_by_key
join #DWH_TABLE_SCHEMA.d_internal_contact IC
on IC.row_key = case when state.state in ('CLOSED', 'RESOLVED') then F.last_resolved_by_key else F.opened_by_key end
join
(
   select ic.*, icm.full_name asgn_to_man
   FROM #DWH_TABLE_SCHEMA.d_internal_contact ic
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON ic.manager_key = icm.row_key
) asgn_to
on asgn_to.row_key = F.assigned_to_key
join
(
  select iog.*, icm.full_name asgn_grp_man
  FROM #DWH_TABLE_SCHEMA.d_internal_organization iog
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON iog.manager_key = icm.row_key
  WHERE iog.group_flag = 'Y'::bpchar OR iog.row_key = 0 OR iog.row_key = -1
) asgn_grp
on asgn_grp.row_key = F.assignment_group_key
join
(
  Select *
   FROM #DWH_TABLE_SCHEMA.d_internal_contact
  WHERE d_internal_contact.current_flag = 'Y'
) emp_mdm
on emp_mdm.row_current_key = IC.row_current_key
join 
(
  select d_location.*
   FROM #DWH_TABLE_SCHEMA.d_location d_location
  WHERE (d_location.row_key IN ( SELECT DISTINCT d_internal_contact.location_key
           FROM #DWH_TABLE_SCHEMA.d_internal_contact))
) LOC
on LOC.row_key = F.location_key
join 
(
  select *
   FROM #DWH_TABLE_SCHEMA.d_lov
  WHERE d_lov.dimension_class = 'WH_SLA_FLAG~TASK_SLA' OR d_lov.row_key = -1 OR d_lov.row_key = 0
) d_task_sla_reso
on d_task_sla_reso.row_key = D.met_resolution_sla_flag_key
join 
(
  select *
   FROM #DWH_TABLE_SCHEMA.d_lov
  WHERE d_lov.dimension_class = 'WH_SLA_FLAG~TASK_SLA' OR d_lov.row_key = -1 OR d_lov.row_key = 0
) d_task_sla_resp
on d_task_sla_resp.row_key = D.met_response_sla_flag_key
-- join
-- (
--   select d_internal_organization.*, 
--   FROM #DWH_TABLE_SCHEMA.d_internal_organization
--   WHERE d_internal_organization.group_flag = 'Y' OR d_internal_organization.row_key = 0 OR d_internal_organization.row_key = -1
-- ) ORG
-- on ORG.row_key = F.assignment_group_key

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

where -- CAL.lagging_count_of_days between 0 and 29
(CAL.lagging_count_of_days between 0 and 29
 or CAL.lagging_count_of_days = 1
 or CAL.lagging_count_of_days between 30 and 59
 or CAL.lagging_count_of_days between 7 and 13)
group by asgn_grp.organization_name, pr
order by upper(asgn_grp.organization_name), pr