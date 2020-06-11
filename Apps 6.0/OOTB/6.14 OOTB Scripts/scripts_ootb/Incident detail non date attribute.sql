select dc.full_name as "Assigned To" , fi.opened_on_key ,ci.name as "Configuration Name" , oc.customer_name as "Customer Name",oc.customer_contact1_name as "Customer Contact Name1", oc.customer_contact2_name as "Customer Contact Name2",dc.full_name as "Caller", di.exclude_flag as "Exclude flag",
di.source_url as "Incident" ,di.backlog_flag as "Incident Backlog" ,dv_1.dimension_name,di.cause_code as "Incident Cause Code" , di.caused_by_change_flag as "Incident Caused by Change" ,di.problem_flag as "Incident Caused by Problem" ,di.is_caused_by_change_task_flag as "Incident Caused by task", di.knowledge_flag as "Incident causing knowledge" ,fi.close_code_src_key as "close code" , di.met_sla_flag as "Incident met all sla",
di.multiple_assignment_flag as "Incident multiple assignment" , di.priority_escalated_flag as "Incident priority escalated", di.reopened_flag as "Incident Reopened",
dv.dimension_name as "Incident severity",di.short_description as "Incident short description" ,
dv_2.dimension_name as "Incident sub Category source", di.pending_reason as "Pending reason" ,  dv_3.dimension_name as "Task impact" ,dv_4.dimension_name as "Task Priority" , fi.reported_type_src_code as "Task reported type" ,dv_5.dimension_name as "Task Urgency source "
from  #DWH_TABLE_SCHEMA.f_incident fi 
left join #DWH_TABLE_SCHEMA.d_internal_contact dc
on  fi.opened_by_key = dc.row_key
left join #DWH_TABLE_SCHEMA.d_incident di
on  fi.incident_key = di.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date dcdo
on  fi.opened_on_key = dcdo.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date dcdc
on fi.closed_on_key = dcdc.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date dcdr
on fi.last_resolved_by_key = dcdr.row_key
 left join #DWH_TABLE_SCHEMA.d_internal_organization dio 
on fi.opened_by_department_key = dio.row_key
left join #DWH_TABLE_SCHEMA.d_configuration_item ci
on  fi.configuration_item_key = ci.row_key
left join  #DWH_TABLE_SCHEMA.d_lov  dv 
on fi.severity_src_key  = dv.row_key
left join #DWH_TABLE_SCHEMA.d_lov dv_1
on fi.category_src_key = dv_1.row_key
left join #DWH_TABLE_SCHEMA.d_lov dv_2
on fi.sub_category_src_key = dv_2.row_key
left join  #DWH_TABLE_SCHEMA.d_lov_map dvm
on dvm.dimension_code  = dv.dimension_code
and dvm.dimension_class=dv.dimension_class
left join #DWH_TABLE_SCHEMA.d_domain dom
on dom.row_key = fi.domain_key
 left join #DWH_TABLE_SCHEMA.d_lov dv_3
on dv_3.row_key = fi.impact_src_key
left join #DWH_TABLE_SCHEMA.d_lov dv_4 
on fi.priority_src_key = dv_4.row_key
left join #DWH_TABLE_SCHEMA.d_lov dv_5
on fi.urgency_src_key = dv_5.row_key
left join #DWH_TABLE_SCHEMA.d_organization_customer oc
on oc.row_key = fi.customer_key
where dcdc.lagging_count_of_month between 0 and 12
or dcdo.lagging_count_of_month between 0 and 12
or dcdr.lagging_count_of_month between 0 and 12
--where di.incident_number = 'INC0011271'
--group by dc.full_name,ci.name ,di.exclude_flag , di.incident_number,dv.dimension_class ,di.backlog_flag
order by di.source_url asc;