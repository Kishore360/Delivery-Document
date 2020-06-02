select
DIC_OPND.full_name opndby,
DIC_CLSD.full_name clsdby,

trim(to_char(count(case when tsk_st.wh_dimension_name in ('CLOSED', 'RESOLVED') and F.task_key is not null then F.task_key else null end),'FM999,999,999')) as clsdtasks

from 
#DWH_TABLE_SCHEMA.f_task F
join #DWH_TABLE_SCHEMA.d_task D
on F.task_key = D.row_key
join
(
 SELECT COALESCE(wh_lov.row_id, task_state.row_id) AS wh_row_id, COALESCE(wh_lov.dimension_name, task_state.dimension_name) AS wh_dimension_name, COALESCE(task_state.dimension_name, concat(concat(' (', task_lov_x_bi.dimension_name), ')')) AS source_dimension_name, task_state.dimension_code AS source_dimension_code, COALESCE(wh_lov.dimension_code, task_state.dimension_code) AS wh_dimension_code, task_state.effective_to, task_state.created_by, task_state.row_key, task_state.etl_run_number, task_state.effective_from, task_state.row_id, task_state.secondary1_changed_on, task_state.secondary2_changed_on, task_state.created_on, task_state.soft_deleted_flag, task_state.current_flag, task_state.row_dn_key, task_state.changed_on, task_state.cdctype, task_state.row_current_key, task_state.dw_updated_on, task_state.source_id, task_state.changed_by, task_state.dw_inserted_on
   FROM #DWH_TABLE_SCHEMA.d_lov task_state
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON task_state.row_key = br.src_key AND task_state.row_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map task_lov_map_x_bi ON ("substring"(task_state.dimension_class, length('STATE~') + 1, 100) = task_lov_map_x_bi.dimension_code OR "substring"(task_state.dimension_class, length('REQUEST_STATE~') + 1, 100) = task_lov_map_x_bi.dimension_code) AND task_lov_map_x_bi.dimension_class = 'TASK_TYPE~TASK'
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov task_lov_x_bi ON task_lov_map_x_bi.wh_key = task_lov_x_bi.row_key
  WHERE 
  task_state.dimension_class = 'STATE~SC_TASK' 
  OR task_state.dimension_class = 'STATE~INCIDENT' 
  OR task_state.dimension_class = 'STATE~CHANGE_REQUEST' 
  OR task_state.dimension_class = 'STATE~PROBLEM' 
  OR task_state.dimension_class = 'STATE~PROBLEM_TASK' 
  OR task_state.dimension_class = 'STATE~SC_REQ_ITEM' 
  OR task_state.dimension_class = 'REQUEST_STATE~SC_REQUEST' 
  OR task_state.dimension_class = 'STATE~CHANGE_TASK' 
  OR task_state.row_key = -1 OR task_state.row_key = 0
 ) tsk_st
 on tsk_st.row_key = D.state_src_key
 join #DWH_TABLE_SCHEMA.d_calendar_date CAL
 on CAL.row_key = F.opened_on_key
 join #DWH_TABLE_SCHEMA.d_calendar_date CAL_MON
 on CAL_MON.row_key = CAL.month_start_date_key
 join #DWH_TABLE_SCHEMA.d_application APP
 on APP.row_key = F.application_key
 join
 (
  select business_service.*
  FROM #DWH_TABLE_SCHEMA.d_service business_service
  WHERE business_service.is_business_service_flag = 'Y'::bpchar OR business_service.row_key = 0 OR business_service.row_key = -1
 ) SRVC
 on SRVC.row_key = F.business_service_key
 join  #DWH_TABLE_SCHEMA.d_configuration_item CI
 on CI.row_key = F.configuration_item_key
 join #DWH_TABLE_SCHEMA.d_internal_contact DIC
 on DIC.row_key = F.opened_by_key
 join 
 (
 SELECT assigned_to.*
 FROM #DWH_TABLE_SCHEMA.d_internal_contact assigned_to
   JOIN #DWH_TABLE_SCHEMA.d_internal_contact fco_d_internal_contact ON assigned_to.manager_key = fco_d_internal_contact.row_key
 ) ASGNTO
 on ASGNTO.row_key = F.assigned_to_key
 join
 (
  SELECT dh_all_hierarchies_dimension.lev_5_key, dh_user_group_level2_bi.organization_name AS lev_2_organization_name, assignment_group.organization_name, dh_user_group_level3_bi.organization_name AS lev_3_organization_name, dh_all_hierarchies_dimension.lev_4_key, dh_user_group_level5_bi.organization_name AS lev_5_organization_name, dh_user_group_level4_bi.organization_name AS lev_4_organization_name, dh_all_hierarchies_dimension.lev_2_key, dh_all_hierarchies_dimension.lev_0_key, assignment_group.emp_count, dh_user_group_level1_bi.organization_name AS lev_1_organization_name, dh_all_hierarchies_dimension.lev_1_key, dh_all_hierarchies_dimension.lev_3_key, fco_d_internal_contact.full_name AS manager, assignment_group.soft_deleted_flag, assignment_group.row_current_key, assignment_group.changed_by, assignment_group.dw_updated_on, assignment_group.changed_on, assignment_group.current_flag, assignment_group.source_id, assignment_group.secondary2_changed_on, assignment_group.effective_from, assignment_group.created_by, assignment_group.row_dn_key, assignment_group.location_key, assignment_group.secondary1_changed_on, assignment_group.cdctype, assignment_group.effective_to, assignment_group.created_on, assignment_group.row_id, assignment_group.etl_run_number, assignment_group.row_key, assignment_group.dw_inserted_on
   FROM #DWH_TABLE_SCHEMA.d_internal_organization assignment_group
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact fco_d_internal_contact ON assignment_group.manager_key = fco_d_internal_contact.row_key
   JOIN #DWH_TABLE_SCHEMA.d_h_all_hierarchies dh_all_hierarchies_dimension ON assignment_group.row_dn_key = dh_all_hierarchies_dimension.lev_0_key AND (dh_all_hierarchies_dimension.hierarchy_class = 'USER GROUP' OR dh_all_hierarchies_dimension.hierarchy_class = 'UNSPECIFIED' OR dh_all_hierarchies_dimension.hierarchy_class = 'UNKNOWN') AND dh_all_hierarchies_dimension.current_flag = 'Y'::bpchar
   JOIN #DWH_TABLE_SCHEMA.d_internal_organization dh_user_group_level1_bi ON dh_all_hierarchies_dimension.lev_1_key = dh_user_group_level1_bi.row_key AND dh_user_group_level1_bi.group_flag = 'Y'::bpchar AND dh_user_group_level1_bi.current_flag = 'Y'::bpchar
   JOIN #DWH_TABLE_SCHEMA.d_internal_organization dh_user_group_level2_bi ON dh_all_hierarchies_dimension.lev_2_key = dh_user_group_level2_bi.row_key AND dh_user_group_level2_bi.group_flag = 'Y'::bpchar AND dh_user_group_level2_bi.current_flag = 'Y'::bpchar
   JOIN #DWH_TABLE_SCHEMA.d_internal_organization dh_user_group_level3_bi ON dh_all_hierarchies_dimension.lev_3_key = dh_user_group_level3_bi.row_key AND dh_user_group_level3_bi.group_flag = 'Y'::bpchar AND dh_user_group_level3_bi.current_flag = 'Y'::bpchar
   JOIN #DWH_TABLE_SCHEMA.d_internal_organization dh_user_group_level4_bi ON dh_all_hierarchies_dimension.lev_4_key = dh_user_group_level4_bi.row_key AND dh_user_group_level4_bi.group_flag = 'Y'::bpchar AND dh_user_group_level4_bi.current_flag = 'Y'::bpchar
   JOIN #DWH_TABLE_SCHEMA.d_internal_organization dh_user_group_level5_bi ON dh_all_hierarchies_dimension.lev_5_key = dh_user_group_level5_bi.row_key AND dh_user_group_level5_bi.group_flag = 'Y'::bpchar AND dh_user_group_level5_bi.current_flag = 'Y'::bpchar
  WHERE assignment_group.group_flag = 'Y'::bpchar OR assignment_group.row_key = 0 OR assignment_group.row_key = -1
 ) ASGNGRP
 on ASGNGRP.row_key = F.assignment_group_key
 join
 (
 select loc.*
 FROM #DWH_TABLE_SCHEMA.d_location loc
 LEFT JOIN #DWH_TABLE_SCHEMA.d_geography geo ON loc.geo_key = geo.row_key AND loc.source_id = geo.source_id
 ) LOC
 on LOC.row_key = F.location_key
 join
 (
 SELECT parent_task.*
 FROM #DWH_TABLE_SCHEMA.d_task parent_task
 WHERE parent_task.parent_task_flag = 'Y'::bpchar OR parent_task.row_key = -1 OR parent_task.row_key = 0
 ) parent_task
 on parent_task.row_key = D.parent_task_key
 join #DWH_TABLE_SCHEMA.d_internal_contact DIC_OPND
 on DIC_OPND.row_key = F.opened_by_key
 join #DWH_TABLE_SCHEMA.d_internal_contact DIC_CLSD
 on DIC_CLSD.row_key = F.closed_by_key
 join 
 (
  SELECT COALESCE(wh_lov.row_id, task_approval.row_id) AS wh_row_id, task_approval.dimension_name AS source_dimension_name, COALESCE(wh_lov.dimension_name, task_approval.dimension_name) AS wh_dimension_name, task_approval.dimension_code AS source_dimension_code, COALESCE(wh_lov.dimension_code, task_approval.dimension_code) AS wh_dimension_code, task_approval.effective_to, task_approval.created_by, task_approval.row_key, task_approval.etl_run_number, task_approval.effective_from, task_approval.row_id, task_approval.secondary1_changed_on, task_approval.secondary2_changed_on, task_approval.created_on, task_approval.soft_deleted_flag, task_approval.current_flag, task_approval.row_dn_key, task_approval.changed_on, task_approval.cdctype, task_approval.row_current_key, task_approval.dw_updated_on, task_approval.source_id, task_approval.changed_by, task_approval.dw_inserted_on
   FROM #DWH_TABLE_SCHEMA.d_lov task_approval
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON task_approval.row_key = br.src_key AND task_approval.row_key <> 0 AND task_approval.row_key <> -1
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key
  WHERE task_approval.row_key = 0 OR task_approval.row_key = -1 OR task_approval.dimension_class = 'APPROVAL~TASK'
 ) tsk_aprv
 on tsk_aprv.row_key = D.approval_src_key
 join
 (
  SELECT task_contact_type.dimension_code AS source_dimension_code, task_contact_type.dimension_name AS source_dimension_name, ' ' AS wh_dimension_name, ' ' AS wh_row_id, ' ' AS wh_dimension_code, task_contact_type.effective_to, task_contact_type.created_by, task_contact_type.row_key, task_contact_type.etl_run_number, task_contact_type.effective_from, task_contact_type.row_id, task_contact_type.secondary1_changed_on, task_contact_type.secondary2_changed_on, task_contact_type.created_on, task_contact_type.soft_deleted_flag, task_contact_type.current_flag, task_contact_type.row_dn_key, task_contact_type.changed_on, task_contact_type.cdctype, task_contact_type.row_current_key, task_contact_type.dw_updated_on, task_contact_type.source_id, task_contact_type.changed_by, task_contact_type.dw_inserted_on
   FROM #DWH_TABLE_SCHEMA.d_lov task_contact_type
  WHERE task_contact_type.dimension_class = 'CONTACT_TYPE~TASK' 
  OR task_contact_type.row_key = -1 OR task_contact_type.row_key = 0
 ) tsk_cnt_typ
 on tsk_cnt_typ.row_key = D.contact_type_src_key
 join 
 (
 SELECT concat(task_impact.dimension_name, concat(concat(' (', task_lov_x_bi.dimension_name), ')')) AS source_dimension_name, COALESCE(wh_lov.dimension_code, task_impact.dimension_code) AS wh_dimension_code, COALESCE(wh_lov.row_id, task_impact.row_id) AS wh_row_id, task_impact.dimension_code AS source_dimension_code, COALESCE(wh_lov.dimension_name, task_impact.dimension_name) AS wh_dimension_name, task_impact.effective_to, task_impact.created_by, task_impact.row_key, task_impact.etl_run_number, task_impact.effective_from, task_impact.row_id, task_impact.secondary1_changed_on, task_impact.secondary2_changed_on, task_impact.created_on, task_impact.soft_deleted_flag, task_impact.current_flag, task_impact.row_dn_key, task_impact.changed_on, task_impact.cdctype, task_impact.row_current_key, task_impact.dw_updated_on, task_impact.source_id, task_impact.changed_by, task_impact.dw_inserted_on
   FROM #DWH_TABLE_SCHEMA.d_lov task_impact
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON task_impact.row_key = br.src_key AND task_impact.row_key <> -1 AND task_impact.row_key <> 0
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map task_lov_map_x_bi ON "substring"(task_impact.dimension_class, length('IMPACT~') + 1, 100) = task_lov_map_x_bi.dimension_code AND task_lov_map_x_bi.dimension_class = 'TASK_TYPE~TASK'
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov task_lov_x_bi ON task_lov_map_x_bi.wh_key = task_lov_x_bi.row_key
  WHERE task_impact.dimension_class = 'IMPACT~SC_TASK' OR task_impact.dimension_class = 'IMPACT~INCIDENT' OR task_impact.dimension_class = 'IMPACT~CHANGE_REQUEST' OR task_impact.dimension_class = 'IMPACT~PROBLEM' OR task_impact.dimension_class = 'IMPACT~PROBLEM_TASK' OR task_impact.dimension_class = 'IMPACT~SC_REQ_ITEM' OR task_impact.dimension_class = 'IMPACT~SC_REQUEST' OR task_impact.dimension_class = 'IMPACT~CHANGE_TASK' OR task_impact.row_key = -1 OR task_impact.row_key = 0
 ) tsk_impct
 on tsk_impct.row_key = D.impact_src_key
 join 
 (
 SELECT COALESCE(wh_lov.dimension_code, task_priority.dimension_code) AS wh_dimension_code, task_priority.dimension_code AS source_dimension_code, task_priority.dimension_name AS parent_source_dimension_name, concat(task_priority.dimension_name, concat(concat(' (', task_lov_x_bi.dimension_name), ')')) AS source_dimension_name, COALESCE(wh_lov.row_id, task_priority.row_id) AS wh_row_id, COALESCE(wh_lov.dimension_name, task_priority.dimension_name) AS wh_dimension_name, task_priority.effective_to, task_priority.created_by, task_priority.row_key, task_priority.etl_run_number, task_priority.effective_from, task_priority.row_id, task_priority.secondary1_changed_on, task_priority.secondary2_changed_on, task_priority.created_on, task_priority.soft_deleted_flag, task_priority.current_flag, task_priority.row_dn_key, task_priority.changed_on, task_priority.cdctype, task_priority.row_current_key, task_priority.dw_updated_on, task_priority.source_id, task_priority.changed_by, task_priority.dw_inserted_on
   FROM #DWH_TABLE_SCHEMA.d_lov task_priority
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON task_priority.row_key = br.src_key AND task_priority.row_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.dimension_class
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map task_lov_map_x_bi ON "substring"(task_priority.dimension_class, length('PRIORITY~') + 1, 100) = task_lov_map_x_bi.dimension_code AND task_lov_map_x_bi.dimension_class = 'TASK_TYPE~TASK'
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov task_lov_x_bi ON task_lov_map_x_bi.wh_key = task_lov_x_bi.row_key
  WHERE task_priority.dimension_class = 'PRIORITY~SC_TASK' OR task_priority.dimension_class = 'PRIORITY~INCIDENT' OR task_priority.dimension_class = 'PRIORITY~CHANGE_REQUEST' OR task_priority.dimension_class = 'PRIORITY~PROBLEM' OR task_priority.dimension_class = 'PRIORITY~PROBLEM_TASK' OR task_priority.dimension_class = 'PRIORITY~SC_REQ_ITEM' OR task_priority.dimension_class = 'PRIORITY~SC_REQUEST' OR task_priority.dimension_class = 'PRIORITY~CHANGE_TASK' OR task_priority.row_key = -1 OR task_priority.row_key = 0
 ) tsk_prio
 on tsk_prio.row_key = D.priority_src_key
 join
 (
 SELECT COALESCE(wh_lov.dimension_code, task_task_type.dimension_code) AS wh_dimension_code, task_task_type.dimension_name AS source_dimension_name, task_task_type.effective_to, task_task_type.created_by, task_task_type.row_key, task_task_type.etl_run_number, task_task_type.effective_from, task_task_type.row_id, task_task_type.secondary1_changed_on, task_task_type.secondary2_changed_on, task_task_type.created_on, task_task_type.soft_deleted_flag, task_task_type.current_flag, task_task_type.row_dn_key, task_task_type.changed_on, task_task_type.cdctype, task_task_type.row_current_key, task_task_type.dw_updated_on, task_task_type.source_id, task_task_type.changed_by, task_task_type.dw_inserted_on
   FROM #DWH_TABLE_SCHEMA.d_lov task_task_type
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON task_task_type.row_key = br.src_key AND task_task_type.row_key <> -1 AND task_task_type.row_key <> 0
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key
  WHERE task_task_type.row_key = -1 OR task_task_type.row_key = 0 OR task_task_type.dimension_class = 'TASK_TYPE~TASK'
 ) tsk_typ
 on tsk_typ.row_key = D.task_type_src_key
 join 
 (
 SELECT COALESCE(wh_lov.dimension_code, task_urgency.dimension_code) AS wh_dimension_code, task_urgency.dimension_code AS source_dimension_code, concat(task_urgency.dimension_name, concat(concat(' (', task_lov_x_bi.dimension_name), ')')) AS source_dimension_name, COALESCE(wh_lov.row_id, task_urgency.row_id) AS wh_row_id, COALESCE(wh_lov.dimension_name, task_urgency.dimension_name) AS wh_dimension_name, task_urgency.effective_to, task_urgency.created_by, task_urgency.row_key, task_urgency.etl_run_number, task_urgency.effective_from, task_urgency.row_id, task_urgency.secondary1_changed_on, task_urgency.secondary2_changed_on, task_urgency.created_on, task_urgency.soft_deleted_flag, task_urgency.current_flag, task_urgency.row_dn_key, task_urgency.changed_on, task_urgency.cdctype, task_urgency.row_current_key, task_urgency.dw_updated_on, task_urgency.source_id, task_urgency.changed_by, task_urgency.dw_inserted_on
   FROM #DWH_TABLE_SCHEMA.d_lov task_urgency
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON task_urgency.row_key = br.src_key AND task_urgency.row_key <> -1 AND task_urgency.row_key <> 0
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map task_lov_map_x_bi ON "substring"(task_urgency.dimension_class, length('URGENCY~') + 1, 100) = task_lov_map_x_bi.dimension_code AND task_lov_map_x_bi.dimension_class = 'TASK_TYPE~TASK'
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov task_lov_x_bi ON task_lov_map_x_bi.wh_key = task_lov_x_bi.row_key
  WHERE task_urgency.dimension_class = 'URGENCY~CHANGE_REQUEST' OR task_urgency.dimension_class = 'URGENCY~INCIDENT' OR task_urgency.dimension_class = 'URGENCY~PROBLEM' OR task_urgency.dimension_class = 'URGENCY~PROBLEM_TASK' OR task_urgency.dimension_class = 'URGENCY~SC_REQ_ITEM' OR task_urgency.dimension_class = 'URGENCY~SC_REQUEST' OR task_urgency.dimension_class = 'URGENCY~SC_TASK' OR task_urgency.dimension_class = 'URGENCY~CHANGE_TASK' OR task_urgency.row_key = -1 OR task_urgency.row_key = 0
 ) tsk_urg
 on tsk_urg.row_key = D.urgency_src_key
 where CAL_MON.lagging_count_of_month between 0 and 12
 or D.backlog_flag = 'Y'
 group by DIC_OPND.full_name, DIC_CLSD.full_name
 having count(case when tsk_st.wh_dimension_name in ('CLOSED', 'RESOLVED') and F.task_key is not null then F.task_key else null end) > 0
 order by upper(DIC_OPND.full_name), upper(DIC_CLSD.full_name)