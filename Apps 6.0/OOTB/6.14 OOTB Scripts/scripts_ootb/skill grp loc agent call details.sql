select skill.name as skill_name,grp_lvl.organization_name as group_name,LOC.location_name as location_name,
Round(case when SUM(F.I_STAFF_TIME)=0 then NULL else SUM(F.I_ACD_TIME + I_ACW_TIME)*100.0 /SUM(F.I_STAFF_TIME)end) percent_ACD_Time_Agent,
Round(case when sum(F.I_Staff_Time) =0 then NULL else sum(F.I_Aux_Time)*1.00/sum(F.I_Staff_Time) end) time_spent_aux,
Round(case when sum(F.TI_AVAIL_TIME) =0 or sum(F.TI_STAFF_TIME) =0 then NULL else (sum(F.I_AVAIL_TIME) / sum(F.TI_AVAIL_TIME)) *100.0/ (sum(F.I_STAFF_TIME) / sum(F.TI_STAFF_TIME))end) Skill_Available_Agent
from 
(
SELECT a.row_key, a.row_id, a.source_id, a.etl_run_number, a.time_key, a.day_key, a.employee_key, b.group_lvl_key, a.skill_key, a.acd_key, a.shift_key, a.location_key, a.cost_center_key, a.department_key, a.abandon_time, a.abandoned_calls, a.acd_aux_out_calls, a.acd_calls, a.acd_release, a.acd_time, a.acw_in_calls, a.acw_in_time, a.acw_out_calls, a.acw_out_time, a.acw_time, a.answer_ring_time, a.aux_in_calls, a.aux_in_time, a.aux_out_calls, a.aux_out_time, a.da_abandon_time, a.da_abandoned_calls, a.da_acd_calls, a.da_acd_time, a.da_acw_in_calls, a.da_acw_in_time, a.da_acw_out_calls, a.da_acw_out_time, a.da_acw_time, a.da_answer_time, a.da_other_calls, a.da_other_time, a.hold_abandon_calls, a.hold_acd_time, a.hold_calls, a.hold_time, a.i_acd_auxin_time, a.i_acd_auxout_time, a.i_acd_time, a.i_acw_in_time, a.i_acw_out_time, a.i_acw_time, a.i_aux_in_time, a.i_aux_out_time, a.i_aux_time, a.i_avail_time, a.i_da_acd_time, a.i_da_acw_time, a.i_other_state_time, a.i_other_time, a.i_ring_time, a.i_staff_time, a.inbound_acd_calls, a.inbound_acd_time, a.inbound_acw_time, a.no_answer_redirect_calls, a.outbound_acd_calls, a.outbound_acd_time, a.outbound_acw_time, a.ring_calls, a.ring_time, a.ti_aux_time, a.ti_avail_time, a.ti_other_time, a.ti_staff_time, a.time_interval, a.pivot_date, a.soft_deleted_flag, a.created_by, a.changed_by, a.created_on, a.changed_on, a.dw_inserted_on, a.dw_updated_on
   FROM #DWH_TABLE_SCHEMA.f_agent_call_summary a
   JOIN #DWH_TABLE_SCHEMA.d_internal_contact_organization b ON a.employee_key = b.agent_key AND b.current_flag = 'Y'::bpchar
  WHERE a.soft_deleted_flag = 'N'::bpchar
UNION 
 SELECT a.row_key, a.row_id, a.source_id, a.etl_run_number, a.time_key, a.day_key, a.employee_key, 9999 AS group_lvl_key, a.skill_key, a.acd_key, a.shift_key, a.location_key, a.cost_center_key, a.department_key, a.abandon_time, a.abandoned_calls, a.acd_aux_out_calls, a.acd_calls, a.acd_release, a.acd_time, a.acw_in_calls, a.acw_in_time, a.acw_out_calls, a.acw_out_time, a.acw_time, a.answer_ring_time, a.aux_in_calls, a.aux_in_time, a.aux_out_calls, a.aux_out_time, a.da_abandon_time, a.da_abandoned_calls, a.da_acd_calls, a.da_acd_time, a.da_acw_in_calls, a.da_acw_in_time, a.da_acw_out_calls, a.da_acw_out_time, a.da_acw_time, a.da_answer_time, a.da_other_calls, a.da_other_time, a.hold_abandon_calls, a.hold_acd_time, a.hold_calls, a.hold_time, a.i_acd_auxin_time, a.i_acd_auxout_time, a.i_acd_time, a.i_acw_in_time, a.i_acw_out_time, a.i_acw_time, a.i_aux_in_time, a.i_aux_out_time, a.i_aux_time, a.i_avail_time, a.i_da_acd_time, a.i_da_acw_time, a.i_other_state_time, a.i_other_time, a.i_ring_time, a.i_staff_time, a.inbound_acd_calls, a.inbound_acd_time, a.inbound_acw_time, a.no_answer_redirect_calls, a.outbound_acd_calls, a.outbound_acd_time, a.outbound_acw_time, a.ring_calls, a.ring_time, a.ti_aux_time, a.ti_avail_time, a.ti_other_time, a.ti_staff_time, a.time_interval, a.pivot_date, a.soft_deleted_flag, a.created_by, a.changed_by, a.created_on, a.changed_on, a.dw_inserted_on, a.dw_updated_on
   FROM #DWH_TABLE_SCHEMA.f_agent_call_summary a
   JOIN #DWH_TABLE_SCHEMA.d_internal_contact b ON a.employee_key = b.row_key AND b.current_flag = 'Y'::bpchar
  WHERE a.soft_deleted_flag = 'N'::bpchar
) F
join  
(
select d_acd.*
FROM #DWH_TABLE_SCHEMA.d_acd d_acd
)acd
on acd.row_key = F.acd_key
join 
(
SELECT d_calendar_date.*
   FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_day ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
) CAL
on F.day_key = CAL.row_key
join 
(
select d_calendar_date.*
FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
  WHERE d_calendar_date.month_start_date_key = d_calendar_date.row_key AND d_calendar_date.source_id = 0
) cal_mon
on cal.month_start_date_key = cal_mon.row_key
left join 
(
   select d_cost_center.*
   FROM #DWH_TABLE_SCHEMA.d_cost_center d_cost_center
) cost_center
on F.cost_center_key = cost_center.row_key
join
(
SELECT DIO.effective_to, DIO.department_flag, DIO.secondary1_changed_on, 
DIO.organization_active_flag, DIO.etl_run_number, DIO.row_current_key, 
DIO.country_code, DIO.subsidary_currency_code, DIO.city_code, 
DIO.classification_flag, DIO.organization_contact_id, DIO.emp_count, 
DIO.dw_updated_on, DIO.organization_url, DIO.group_flag, DIO.organization_name, 
DIO.source_id, DIO.address, DIO.cdctype, DIO.created_by, DIO.legal_name, 
DIO.changed_on, DIO.group_lvl_flag, DIO.row_id, DIO.current_flag, 
DIO.postal_code, DIO.subsidiary_flag, DIO.soft_deleted_flag, 
DIO.secondary2_changed_on, DIO.organization_contact_name, DIO.continent_code, 
DIO.dw_inserted_on, DIO.created_on, DIO.inventory_org_flag, DIO.row_dn_key, 
DIO.parent_row_id, DIO.changed_by, DIO.business_unit_flag, DIO.row_key, 
DIO.state_code, DIO.legal_entity_flag, DIO.fax_phone_number, DIO.effective_from, 
DIO.subsidary_fiscal_calendar
   FROM #DWH_TABLE_SCHEMA.d_internal_organization DIO
  WHERE DIO.group_lvl_flag = 'Y'::bpchar 
  AND DIO.current_flag = 'Y'::bpchar
UNION 
 SELECT '2999-12-31 00:00:00' AS effective_to, 
 'N' AS department_flag, NULL::"unknown" AS secondary1_changed_on, 
 'Y' AS organization_active_flag, 9999999 AS etl_run_number, 
 9999 AS row_current_key, NULL::"unknown" AS country_code, 
 NULL::"unknown" AS subsidary_currency_code, NULL::"unknown" AS city_code, 
 'N' AS classification_flag, NULL::"unknown" AS organization_contact_id, 
 NULL::"unknown" AS emp_count, '2999-12-31 00:00:00' AS dw_updated_on, 
 'NULL' AS organization_url, 'N' AS group_flag, 'All Group' AS organization_name, 
 0 AS source_id, NULL::"unknown" AS address, 'A' AS cdctype, 
 NULL::"unknown" AS created_by, NULL::"unknown" AS legal_name, 
 NULL::"unknown" AS changed_on, 'Y' AS group_lvl_flag, 
 'GROUP_LEVEL~9999~All Group' AS row_id, 'Y' AS current_flag, 
 NULL::"unknown" AS postal_code, 'N' AS subsidiary_flag, 'N' AS soft_deleted_flag, 
 NULL::"unknown" AS secondary2_changed_on, NULL::"unknown" AS organization_contact_name, 
 NULL::"unknown" AS continent_code, '2999-12-31 00:00:00' AS dw_inserted_on, 
 NULL::"unknown" AS created_on, 'N' AS inventory_org_flag, 9999 AS row_dn_key, 
 NULL::"unknown" AS parent_row_id, NULL::"unknown" AS changed_by, 
 'N' AS business_unit_flag, 9999 AS row_key, NULL::"unknown" AS state_code, 
 'N' AS legal_entity_flag, NULL::"unknown" AS fax_phone_number, 
 '1970-01-01 00:00:00' AS effective_from, NULL::"unknown" AS subsidary_fiscal_calendar
) grp_lvl
on F.group_lvl_key = grp_lvl.row_key
join
(
select d_internal_contact.*
   FROM #DWH_TABLE_SCHEMA.d_internal_contact d_internal_contact
) DIC
on DIC.row_key = F.employee_key
join
(
   select a.*
   FROM #DWH_TABLE_SCHEMA.d_location a
   LEFT JOIN #DWH_TABLE_SCHEMA.d_geography b ON a.geo_key = b.row_key AND a.source_id = b.source_id
) LOC
on LOC.row_key = F.location_key
join
(
   select d_shift.*
   FROM #DWH_TABLE_SCHEMA.d_shift d_shift
) SHIFT
on SHIFT.row_key = F.shift_key
JOIN 
(
select d_skill.*
FROM #DWH_TABLE_SCHEMA.d_skill d_skill
) SKILL
on SKILL.row_key = F.skill_key
join
(
SELECT d_h_all_hierarchies.*
   FROM #DWH_TABLE_SCHEMA.d_h_all_hierarchies
  WHERE (d_h_all_hierarchies.hierarchy_class::text = 'SKILL'::text OR d_h_all_hierarchies.hierarchy_class::text = 'UNSPECIFIED'::text OR d_h_all_hierarchies.hierarchy_class::text = 'UNKNOWN'::text) AND d_h_all_hierarchies.current_flag = 'Y'::bpchar
) skill_hier
on skill_hier.lev_0_key = SKILL.row_key
JOIN 
(
select d_skill.*
FROM ##DWH_TABLE_SCHEMA.d_skill d_skill
) skill_lvl_1
on skill_lvl_1.row_key = skill_hier.lev_1_key
JOIN 
(
select d_skill.*
FROM ##DWH_TABLE_SCHEMA.d_skill d_skill
) skill_lvl_2
on skill_lvl_2.row_key = skill_hier.lev_2_key
JOIN 
(
select d_skill.*
FROM ##DWH_TABLE_SCHEMA.d_skill d_skill
) skill_lvl_3
on skill_lvl_3.row_key = skill_hier.lev_3_key
JOIN 
(
select d_skill.*
FROM ###DWH_TABLE_SCHEMA.d_skill d_skill
) skill_lvl_4
on skill_lvl_4.row_key = skill_hier.lev_4_key
where cal_mon.lagging_count_of_month between 0 and 12
group by skill.name,grp_lvl.organization_name,LOC.location_name
order by skill.name,grp_lvl.organization_name,LOC.location_name
