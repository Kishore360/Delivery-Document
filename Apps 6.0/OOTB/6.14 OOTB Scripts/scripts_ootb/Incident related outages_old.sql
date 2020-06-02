select COALESCE(INC.incident_number, '') INC_NUMBER,
D_INC.short_description des,
max(case when D_INC.major_incident_flag = 'Y' then 'Y' else 'N' end) major_incident,
COALESCE(to_char(D_INC.opened_on, 'fmmm/fmdd/fmyyyy fmHH:MI:SS AM'), '') INC_Opened, 
max(case when D_INC.OPENED_FOR_SELF_FLAG = 'Y' then 'Y' else 'N' end) opened_for, 
case when INC.priority_src_code is not null then LOV2.dimension_name else LOV.dimension_name end Incident_Priority,
max(case when D_INC.PRIORITY_ESCALATED_FLAG = 'Y' then 'Y' else 'N' end) PRIORITY_ESCALATED,
case when INC.IMPACT_SRC_CODE is not null then LOV5.dimension_name else LOV.dimension_name end Incident_Impact,
case when INC.urgency_src_code is not null then LOV3.dimension_name else LOV.dimension_name end Incident_Urgency,
case when INC.category_src_code is not null then LOV6.dimension_name else LOV.dimension_name end Incident_Category,
COALESCE(case when INC.sub_category_src_code is null then 'UNSPECIFIED' else LOV7.dimension_name end, '') Incident_SubCategory,
case when INC.reported_type_src_code is not null then LOV4.dimension_name else LOV.dimension_name end Incident_Reported_type,
case when CI.name is not null then CI.name else LOV.dimension_name end Incident_CI,
max(case when D_INC.CAUSED_BY_CHANGE_FLAG = 'Y' then 'Y' else 'N' end) CAUSED_BY_CHANGE,
COALESCE(to_char(D_INC.last_resolved_on, 'fmmm/fmdd/fmyyyy fmHH:MI:SS AM'), '') INC_Resolved,
COALESCE(to_char(D_INC.closed_on, 'fmmm/fmdd/fmyyyy fmHH:MI:SS AM'), '') INC_Closed,
max(case when D_INC.MET_SLA_FLAG = 'Y' then 'Y' else 'N' end) MET_SLA,
case when CONTC.full_name is not null then CONTC.full_name else LOV.dimension_name end Asignee, 
case when ORG.organization_name is not null then ORG.organization_name else LOV.dimension_name end Asigned_Grp, 
--'' as Metrics,
sum(case when F.outage_key is not null then 1 else 0 end) Outages
from #DWH_TABLE_SCHEMA.f_outage F
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on F.start_on_key = CAL.row_key
left join #DWH_TABLE_SCHEMA.d_outage D
on F.outage_key = D.row_key
left join #DWH_TABLE_SCHEMA.f_incident INC
on INC.incident_key = F.incident_key
left join #DWH_TABLE_SCHEMA.d_internal_contact CONTC
on CONTC.row_key = INC.assigned_to_key
left join #DWH_TABLE_SCHEMA.d_internal_organization ORG
on ORG.row_key = INC.assignment_group_key
left join #DWH_TABLE_SCHEMA.d_configuration_item CI
on INC.configuration_item_key = CI.row_key
left join #DWH_TABLE_SCHEMA.d_incident D_INC
on D_INC.row_key = F.incident_key
left join #DWH_TABLE_SCHEMA.d_lov LOV
on LOV.row_key = F.incident_key
and F.incident_key in (0,-1)
left join #DWH_TABLE_SCHEMA.d_lov LOV2
on LOV2.row_key = INC.priority_src_key
and LOV2.source_id = INC.source_id
and LOV2.dimension_class = 'PRIORITY~TASK'
left join #DWH_TABLE_SCHEMA.d_lov LOV3
on LOV3.row_key = INC.urgency_src_key
and LOV3.source_id = INC.source_id
and LOV3.dimension_class = 'URGENCY~TASK'
left join #DWH_TABLE_SCHEMA.d_lov LOV4
on LOV4.dimension_code = INC.reported_type_src_code
and LOV4.source_id = INC.source_id
and LOV4.dimension_class = 'CONTACT_TYPE~TASK'
left join #DWH_TABLE_SCHEMA.d_lov LOV5
on LOV5.row_key = INC.IMPACT_SRC_KEY
and LOV5.source_id = INC.source_id
and LOV5.dimension_class = 'IMPACT~TASK'
left join #DWH_TABLE_SCHEMA.d_lov LOV6
on LOV6.row_key = INC.CATEGORY_SRC_KEY
and LOV6.source_id = INC.source_id
and LOV6.dimension_class = 'CATEGORY~INCIDENT'
left join #DWH_TABLE_SCHEMA.d_lov LOV7
on LOV7.row_key = INC.SUB_CATEGORY_SRC_KEY
and LOV7.source_id = INC.source_id
and LOV7.dimension_class = 'SUBCATEGORY~INCIDENT'
where F.row_key not in (0, -1)
and F.soft_deleted_flag = 'N'
and CAL.lagging_count_of_month < 13
group by INC.incident_number, des, INC_Opened, Incident_Priority, Incident_Impact,
Incident_Urgency, Incident_Category, Incident_SubCategory, Incident_Reported_type,
Incident_CI, INC_Resolved, INC_Closed, Asignee, Asigned_Grp
order by lower(INC.incident_number), des, INC_Opened