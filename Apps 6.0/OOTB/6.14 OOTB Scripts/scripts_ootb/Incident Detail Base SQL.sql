select F.incident_number incn


FROM avaya_hf1_mdwdb.f_incident F
join avaya_hf1_mdwdb.d_incident D
on F.incident_key = D.row_key and F.soft_deleted_flag = 'N'
join
(
 SELECT lov.*, br.dimension_wh_code state_code, wh_lov.dimension_name as state
   FROM avaya_hf1_mdwdb.d_lov lov
   LEFT JOIN avaya_hf1_mdwdb.d_lov_map br ON lov.row_key = br.src_key
   JOIN avaya_hf1_mdwdb.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~INCIDENT'
UNION all
 SELECT lov.*, lov.dimension_code state_code, lov.dimension_name as state
   FROM avaya_hf1_mdwdb.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) state
on state.row_key = F.state_src_key
join
(
   select d_calendar_date.*
   FROM avaya_hf1_mdwdb.d_calendar_date d_calendar_date
   LEFT JOIN avaya_hf1_mdwdb.d_calendar_date prev_day ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN avaya_hf1_mdwdb.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN avaya_hf1_mdwdb.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN avaya_hf1_mdwdb.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN avaya_hf1_mdwdb.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
)CAL
on CAL.row_key = case when state.state in ('CLOSED', 'RESOLVED') then F.last_resolved_on_key else F.opened_on_key end
join 
(
 SELECT d_calendar_date.*
   FROM avaya_hf1_mdwdb.d_calendar_date d_calendar_date
   LEFT JOIN avaya_hf1_mdwdb.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN avaya_hf1_mdwdb.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN avaya_hf1_mdwdb.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
  WHERE d_calendar_date.month_start_date_key = d_calendar_date.row_key AND d_calendar_date.source_id = 0
) cal_mon
	  on 	(CAL.month_start_date_key = cal_mon.row_key)
	  
join
(
  SELECT lov.*
  FROM avaya_hf1_mdwdb.d_lov lov
  WHERE lov.dimension_class = 'CATEGORY~INCIDENT' OR lov.row_key = -1 OR lov.row_key = 0
) CATEGORY
on CATEGORY.row_key = D.category_src_key
join
(
   select lov.*, br.dimension_wh_code contact_type_code, wh_lov.dimension_name as contact_type
   FROM avaya_hf1_mdwdb.d_lov lov
   LEFT JOIN avaya_hf1_mdwdb.d_lov_map br ON lov.row_key = br.src_key
   JOIN avaya_hf1_mdwdb.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class::text = 'CONTACT_TYPE~INCIDENT'::text
UNION ALL 
 SELECT lov.*, lov.dimension_code contact_type_code, lov.dimension_name as contact_type
   FROM avaya_hf1_mdwdb.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) CONTACT_TYPE
on CONTACT_TYPE.row_key = F.reported_type_src_key
join
(
 SELECT lov.*, br.dimension_wh_code priority_code, wh_lov.dimension_name as priority
   FROM avaya_hf1_mdwdb.d_lov lov
   LEFT JOIN avaya_hf1_mdwdb.d_lov_map br ON lov.row_key = br.src_key
   JOIN avaya_hf1_mdwdb.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'PRIORITY~INCIDENT'
UNION all
 SELECT lov.*, lov.dimension_code priority_code, lov.dimension_name as priority
   FROM avaya_hf1_mdwdb.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) priority
on priority.row_key = F.priority_src_key
join
(
 SELECT lov.*, lov.dimension_code subcat_code, lov.dimension_name as subcat
   FROM avaya_hf1_mdwdb.d_lov lov
   LEFT JOIN avaya_hf1_mdwdb.d_lov parent ON parent.source_id = lov.source_id 
   AND parent.dimension_class = 'CATEGORY~INCIDENT' 
   AND parent.src_rowid::text = concat(concat('CATEGORY~INCIDENT'::text, '~~~'::text), upper(lov.dimension_type::text))
  WHERE lov.dimension_class = 'SUBCATEGORY~INCIDENT'
UNION all
 SELECT lov.*, lov.dimension_code subcat_code, lov.dimension_name as subcat
   FROM avaya_hf1_mdwdb.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) SUBCATEGORY
on SUBCATEGORY.row_key = D.sub_category_src_key
left join avaya_hf1_mdwdb.d_internal_contact rslvd_by_IC
on rslvd_by_IC.row_key = F.last_resolved_by_key
left join avaya_hf1_mdwdb.d_internal_contact opnd_by_IC
on opnd_by_IC.row_key = F.opened_by_key
join avaya_hf1_mdwdb.d_internal_contact IC
on IC.row_key = case when state.state in ('CLOSED', 'RESOLVED') then F.last_resolved_by_key else F.opened_by_key end
join
(
   select ic.*, icm.full_name asgn_to_man
   FROM avaya_hf1_mdwdb.d_internal_contact ic
   LEFT JOIN avaya_hf1_mdwdb.d_internal_contact icm ON ic.manager_key = icm.row_key
) asgn_to
on asgn_to.row_key = F.assigned_to_key
join
(
  select iog.*, icm.full_name asgn_grp_man
  FROM avaya_hf1_mdwdb.d_internal_organization iog
   LEFT JOIN avaya_hf1_mdwdb.d_internal_contact icm ON iog.manager_key = icm.row_key
  WHERE iog.group_flag = 'Y'::bpchar OR iog.row_key = 0 OR iog.row_key = -1
) asgn_grp
on asgn_grp.row_key = F.assignment_group_key
join 
(
  select d_location.*
   FROM avaya_hf1_mdwdb.d_location d_location
  WHERE (d_location.row_key IN ( SELECT DISTINCT d_internal_contact.location_key
           FROM avaya_hf1_mdwdb.d_internal_contact))
) LOC
on LOC.row_key = F.location_key
join 
(
  select *
   FROM avaya_hf1_mdwdb.d_lov
  WHERE d_lov.dimension_class = 'WH_SLA_FLAG~TASK_SLA' OR d_lov.row_key = -1 OR d_lov.row_key = 0
) d_task_sla_reso
on d_task_sla_reso.row_key = D.met_resolution_sla_flag_key
join 
(
  select *
   FROM avaya_hf1_mdwdb.d_lov
  WHERE d_lov.dimension_class = 'WH_SLA_FLAG~TASK_SLA' OR d_lov.row_key = -1 OR d_lov.row_key = 0
) d_task_sla_resp
on d_task_sla_resp.row_key = D.met_response_sla_flag_key
-- join
-- (
--   select d_internal_organization.*, 
--   FROM avaya_hf1_mdwdb.d_internal_organization
--   WHERE d_internal_organization.group_flag = 'Y' OR d_internal_organization.row_key = 0 OR d_internal_organization.row_key = -1
-- ) ORG
-- on ORG.row_key = F.assignment_group_key

left join
(
select	IOG.row_key AS lev4_ag_key,IO_LEV4.organization_name lev4_org_name,
	count(distinct IO_LEV4.organization_name) AS lev4_ag_count
from 
(
  select d_internal_organization.*
  FROM avaya_hf1_mdwdb.d_internal_organization d_internal_organization
  WHERE d_internal_organization.group_flag = 'Y'::bpchar AND d_internal_organization.current_flag = 'Y'::bpchar
) IO_LEV4
join
(
   select d_h_all_hierarchies.* 
   FROM avaya_hf1_mdwdb.d_h_all_hierarchies d_h_all_hierarchies
  WHERE (d_h_all_hierarchies.hierarchy_class = 'USER GROUP' 
  OR d_h_all_hierarchies.hierarchy_class = 'UNSPECIFIED' 
  OR d_h_all_hierarchies.hierarchy_class = 'UNKNOWN') 
  AND d_h_all_hierarchies.current_flag = 'Y'
) hier
on hier.lev_4_key = IO_LEV4.row_key
join 
(
   select iog.*
   FROM avaya_hf1_mdwdb.d_internal_organization iog
   LEFT JOIN avaya_hf1_mdwdb.d_internal_contact icm ON iog.manager_key = icm.row_key
  WHERE iog.group_flag = 'Y' OR iog.row_key = 0 OR iog.row_key = -1
) IOG
on IOG.row_dn_key = hier.lev_0_key
where	IO_LEV4.organization_name not in ('UNKNOWN', 'UNSPECIFIED')
group by	IOG.row_key, IO_LEV4.organization_name
) lev4_hier
on lev4_hier.lev4_ag_key = F.assignment_group_key
left join
(
select	IOG.row_key AS lev3_ag_key,IO_LEV3.organization_name lev3_org_name,
	count(distinct IO_LEV3.organization_name) AS lev3_ag_count
from 
(
  select d_internal_organization.*
  FROM avaya_hf1_mdwdb.d_internal_organization d_internal_organization
  WHERE d_internal_organization.group_flag = 'Y'::bpchar AND d_internal_organization.current_flag = 'Y'::bpchar
) IO_LEV3
join
(
   select d_h_all_hierarchies.* 
   FROM avaya_hf1_mdwdb.d_h_all_hierarchies d_h_all_hierarchies
  WHERE (d_h_all_hierarchies.hierarchy_class = 'USER GROUP' 
  OR d_h_all_hierarchies.hierarchy_class = 'UNSPECIFIED' 
  OR d_h_all_hierarchies.hierarchy_class = 'UNKNOWN') 
  AND d_h_all_hierarchies.current_flag = 'Y'
) hier
on hier.lev_3_key = IO_LEV3.row_key
join 
(
   select iog.*
   FROM avaya_hf1_mdwdb.d_internal_organization iog
   LEFT JOIN avaya_hf1_mdwdb.d_internal_contact icm ON iog.manager_key = icm.row_key
  WHERE iog.group_flag = 'Y' OR iog.row_key = 0 OR iog.row_key = -1
) IOG
on IOG.row_dn_key = hier.lev_0_key
where	IO_LEV3.organization_name not in ('UNKNOWN', 'UNSPECIFIED')
group by	IOG.row_key, IO_LEV3.organization_name
) lev3_hier
on lev3_hier.lev3_ag_key = F.assignment_group_key
left join
(
select	IOG.row_key AS lev2_ag_key,IO_LEV2.organization_name lev2_org_name,
	count(distinct IO_LEV2.organization_name) AS lev2_ag_count
from 
(
  select d_internal_organization.*
  FROM avaya_hf1_mdwdb.d_internal_organization d_internal_organization
  WHERE d_internal_organization.group_flag = 'Y'::bpchar AND d_internal_organization.current_flag = 'Y'::bpchar
) IO_LEV2
join
(
   select d_h_all_hierarchies.* 
   FROM avaya_hf1_mdwdb.d_h_all_hierarchies d_h_all_hierarchies
  WHERE (d_h_all_hierarchies.hierarchy_class = 'USER GROUP' 
  OR d_h_all_hierarchies.hierarchy_class = 'UNSPECIFIED' 
  OR d_h_all_hierarchies.hierarchy_class = 'UNKNOWN') 
  AND d_h_all_hierarchies.current_flag = 'Y'
) hier
on hier.lev_2_key = IO_LEV2.row_key
join 
(
   select iog.*
   FROM avaya_hf1_mdwdb.d_internal_organization iog
   LEFT JOIN avaya_hf1_mdwdb.d_internal_contact icm ON iog.manager_key = icm.row_key
  WHERE iog.group_flag = 'Y' OR iog.row_key = 0 OR iog.row_key = -1
) IOG
on IOG.row_dn_key = hier.lev_0_key
where	IO_LEV2.organization_name not in ('UNKNOWN', 'UNSPECIFIED')
group by	IOG.row_key, IO_LEV2.organization_name
) lev2_hier
on lev2_hier.lev2_ag_key = F.assignment_group_key
left join
(
select	IOG.row_key AS lev1_ag_key, IO_LEV1.organization_name lev1_org_name,
	count(distinct IO_LEV1.organization_name) AS lev1_ag_count
from 
(
  select d_internal_organization.*
  FROM avaya_hf1_mdwdb.d_internal_organization d_internal_organization
  WHERE d_internal_organization.group_flag = 'Y'::bpchar AND d_internal_organization.current_flag = 'Y'::bpchar
) IO_LEV1
join
(
   select d_h_all_hierarchies.* 
   FROM avaya_hf1_mdwdb.d_h_all_hierarchies d_h_all_hierarchies
  WHERE (d_h_all_hierarchies.hierarchy_class = 'USER GROUP' 
  OR d_h_all_hierarchies.hierarchy_class = 'UNSPECIFIED' 
  OR d_h_all_hierarchies.hierarchy_class = 'UNKNOWN') 
  AND d_h_all_hierarchies.current_flag = 'Y'
) hier
on hier.lev_1_key = IO_LEV1.row_key
join 
(
   select iog.*
   FROM avaya_hf1_mdwdb.d_internal_organization iog
   LEFT JOIN avaya_hf1_mdwdb.d_internal_contact icm ON iog.manager_key = icm.row_key
  WHERE iog.group_flag = 'Y' OR iog.row_key = 0 OR iog.row_key = -1
) IOG
on IOG.row_dn_key = hier.lev_0_key
where	IO_LEV1.organization_name not in ('UNKNOWN', 'UNSPECIFIED')
group by	IOG.row_key, IO_LEV1.organization_name
) lev1_hier
on lev1_hier.lev1_ag_key = F.assignment_group_key

where -- CAL.lagging_count_of_days between 0 and 59
(CAL.lagging_count_of_days between 0 and 29
 or CAL.lagging_count_of_days = 1
 or CAL.lagging_count_of_days between 30 and 59
 or CAL.lagging_count_of_days between 7 and 13)
group by incn
order by incn