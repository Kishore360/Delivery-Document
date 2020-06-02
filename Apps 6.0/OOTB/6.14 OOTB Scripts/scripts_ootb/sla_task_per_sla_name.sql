select 
D.sla_name name,
sla_cat_name.dimension_name sla_cat_details,
concat(round(cast(sum(case when F.outcome_flag='N' and F.exclude_flag='N' then 1 else 0 end ) as numeric)
/count(distinct F.row_key)::numeric*100,1),'%') sla_met_prct,

case when count(distinct case when sla_cat_name.sla_name = 'Resolution' 
and sla_stage.sla_stage_code not in ('CANCELLED') and F.exclude_flag='N' then F.row_key else null end) = 0 then null

else concat(cast(round((sum(case when F.outcome_flag='N' and sla_cat_name.sla_name = 'Resolution' 
and sla_stage.sla_stage_code not in ('CANCELLED') and F.exclude_flag='N' then 1.0000 else 0.0000 end)/
count(distinct case when sla_cat_name.sla_name = 'Resolution' 
and sla_stage.sla_stage_code not in ('CANCELLED') and F.exclude_flag='N' then F.row_key else null end)*1.0000)*100.0000,1) as varchar),'%') end sla_met_prct_res,

case when count(distinct case when sla_cat_name.sla_name = 'Response' 
and sla_stage.sla_stage_code not in ('CANCELLED') and F.exclude_flag='N' then F.row_key else null end) = 0 then null

else concat(cast(round((sum(case when F.outcome_flag='N' and sla_cat_name.sla_name = 'Response' 
and sla_stage.sla_stage_code not in ('CANCELLED') and F.exclude_flag='N' then 1.0000 else 0.0000 end)/
count(distinct case when sla_cat_name.sla_name = 'Response' 
and sla_stage.sla_stage_code not in ('CANCELLED') and F.exclude_flag='N' then F.row_key else null end)*1.0000)*100.0000,1) as varchar),'%') end sla_met_prct_resp

from 
(
   select f_task_sla.*, f_incident.last_resolved_on_key last_resolved_on_key, f_incident.assignment_group_key assignment_group_key
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
on CAL.row_key = F.last_resolved_on_key
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
   select lov.*, br.dimension_wh_code as sla_name_code, wh_lov.dimension_name sla_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'NAME~TASK_SLA'
UNION 
 SELECT lov.*, lov.dimension_code as sla_name_code, lov.dimension_name sla_name
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
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
select	IOG.row_key AS lev4_ag_key,IO_LEV4.organization_name lev4_org_name,
	count(distinct IO_LEV4.organization_name) AS lev4_ag_count
from 
(
  select d_internal_organization.*
  FROM #DWH_TABLE_SCHEMA.d_internal_organization d_internal_organization
  WHERE d_internal_organization.group_flag = 'Y'::bpchar AND d_internal_organization.current_flag = 'Y'::bpchar
) IO_LEV4
join
(
   select d_h_all_hierarchies.* 
   FROM #DWH_TABLE_SCHEMA.d_h_all_hierarchies d_h_all_hierarchies
  WHERE (d_h_all_hierarchies.hierarchy_class = 'USER GROUP' 
  OR d_h_all_hierarchies.hierarchy_class = 'UNSPECIFIED' 
  OR d_h_all_hierarchies.hierarchy_class = 'UNKNOWN') 
  AND d_h_all_hierarchies.current_flag = 'Y'
) hier
on hier.lev_4_key = IO_LEV4.row_key
join 
(
   select iog.*
   FROM #DWH_TABLE_SCHEMA.d_internal_organization iog
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON iog.manager_key = icm.row_key
  WHERE iog.group_flag = 'Y' OR iog.row_key = 0 OR iog.row_key = -1
) IOG
on IOG.row_dn_key = hier.lev_0_key
where	IO_LEV4.organization_name not in ('UNKNOWN', 'UNSPECIFIED')
group by	IOG.row_key, IO_LEV4.organization_name
) lev4_hier
on lev4_hier.lev4_ag_key = F.assignment_group_key
join
(
select	IOG.row_key AS lev3_ag_key,IO_LEV3.organization_name lev3_org_name,
	count(distinct IO_LEV3.organization_name) AS lev3_ag_count
from 
(
  select d_internal_organization.*
  FROM #DWH_TABLE_SCHEMA.d_internal_organization d_internal_organization
  WHERE d_internal_organization.group_flag = 'Y'::bpchar AND d_internal_organization.current_flag = 'Y'::bpchar
) IO_LEV3
join
(
   select d_h_all_hierarchies.* 
   FROM #DWH_TABLE_SCHEMA.d_h_all_hierarchies d_h_all_hierarchies
  WHERE (d_h_all_hierarchies.hierarchy_class = 'USER GROUP' 
  OR d_h_all_hierarchies.hierarchy_class = 'UNSPECIFIED' 
  OR d_h_all_hierarchies.hierarchy_class = 'UNKNOWN') 
  AND d_h_all_hierarchies.current_flag = 'Y'
) hier
on hier.lev_3_key = IO_LEV3.row_key
join 
(
   select iog.*
   FROM #DWH_TABLE_SCHEMA.d_internal_organization iog
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON iog.manager_key = icm.row_key
  WHERE iog.group_flag = 'Y' OR iog.row_key = 0 OR iog.row_key = -1
) IOG
on IOG.row_dn_key = hier.lev_0_key
where	IO_LEV3.organization_name not in ('UNKNOWN', 'UNSPECIFIED')
group by	IOG.row_key, IO_LEV3.organization_name
) lev3_hier
on lev3_hier.lev3_ag_key = F.assignment_group_key
join
(
select	IOG.row_key AS lev2_ag_key,IO_LEV2.organization_name lev2_org_name,
	count(distinct IO_LEV2.organization_name) AS lev2_ag_count
from 
(
  select d_internal_organization.*
  FROM #DWH_TABLE_SCHEMA.d_internal_organization d_internal_organization
  WHERE d_internal_organization.group_flag = 'Y'::bpchar AND d_internal_organization.current_flag = 'Y'::bpchar
) IO_LEV2
join
(
   select d_h_all_hierarchies.* 
   FROM #DWH_TABLE_SCHEMA.d_h_all_hierarchies d_h_all_hierarchies
  WHERE (d_h_all_hierarchies.hierarchy_class = 'USER GROUP' 
  OR d_h_all_hierarchies.hierarchy_class = 'UNSPECIFIED' 
  OR d_h_all_hierarchies.hierarchy_class = 'UNKNOWN') 
  AND d_h_all_hierarchies.current_flag = 'Y'
) hier
on hier.lev_2_key = IO_LEV2.row_key
join 
(
   select iog.*
   FROM #DWH_TABLE_SCHEMA.d_internal_organization iog
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON iog.manager_key = icm.row_key
  WHERE iog.group_flag = 'Y' OR iog.row_key = 0 OR iog.row_key = -1
) IOG
on IOG.row_dn_key = hier.lev_0_key
where	IO_LEV2.organization_name not in ('UNKNOWN', 'UNSPECIFIED')
group by	IOG.row_key, IO_LEV2.organization_name
) lev2_hier
on lev2_hier.lev2_ag_key = F.assignment_group_key
join
(
select	IOG.row_key AS lev1_ag_key, IO_LEV1.organization_name lev1_org_name,
	count(distinct IO_LEV1.organization_name) AS lev1_ag_count
from 
(
  select d_internal_organization.*
  FROM #DWH_TABLE_SCHEMA.d_internal_organization d_internal_organization
  WHERE d_internal_organization.group_flag = 'Y'::bpchar AND d_internal_organization.current_flag = 'Y'::bpchar
) IO_LEV1
join
(
   select d_h_all_hierarchies.* 
   FROM #DWH_TABLE_SCHEMA.d_h_all_hierarchies d_h_all_hierarchies
  WHERE (d_h_all_hierarchies.hierarchy_class = 'USER GROUP' 
  OR d_h_all_hierarchies.hierarchy_class = 'UNSPECIFIED' 
  OR d_h_all_hierarchies.hierarchy_class = 'UNKNOWN') 
  AND d_h_all_hierarchies.current_flag = 'Y'
) hier
on hier.lev_1_key = IO_LEV1.row_key
join 
(
   select iog.*
   FROM #DWH_TABLE_SCHEMA.d_internal_organization iog
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON iog.manager_key = icm.row_key
  WHERE iog.group_flag = 'Y' OR iog.row_key = 0 OR iog.row_key = -1
) IOG
on IOG.row_dn_key = hier.lev_0_key
where	IO_LEV1.organization_name not in ('UNKNOWN', 'UNSPECIFIED')
group by	IOG.row_key, IO_LEV1.organization_name
) lev1_hier
on lev1_hier.lev1_ag_key = F.assignment_group_key
where CAL.lagging_count_of_month between 0 and 12

group by name, D.row_key, sla_cat_details
order by name, D.row_key, sla_cat_details