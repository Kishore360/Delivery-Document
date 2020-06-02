drop table #STG_TABLE_SCHEMA.f_change_credit_score_base;

CREATE TABLE if not exists #STG_TABLE_SCHEMA.f_change_credit_score_base (
  task_type varchar(30)DEFAULT NULL,
  debit_score decimal(28,10) DEFAULT NULL,
  department_key varchar(20) DEFAULT NULL,
  row_id varchar(255)DEFAULT NULL,
  caused_by_change_key varchar(20) DEFAULT NULL,
  assigned_to_key bigint(20) DEFAULT NULL,
  changed_by varchar(60)DEFAULT NULL,
  task_priority varchar(60)DEFAULT NULL,
  changed_on datetime DEFAULT NULL,
  source_id smallint(6) DEFAULT NULL,
  opened_by_key bigint(20) DEFAULT NULL,
  application_key bigint(20) DEFAULT NULL,
  configuration_item_key bigint(20) DEFAULT NULL,
  created_by varchar(60)DEFAULT NULL,
  age decimal(28,10) DEFAULT NULL,
  assignment_group_key bigint(20) DEFAULT NULL,
  task_key bigint(20) DEFAULT NULL,
  task_duration decimal(28,10) DEFAULT NULL,
  caused_by_change_closed_on_key bigint(20) DEFAULT NULL,
  created_on datetime DEFAULT NULL,
  task_state bigint(20) DEFAULT NULL,
  business_service_key bigint(20) DEFAULT NULL
  );
  
 SET SQL_SAFE_UPDATES = 0; 
delete from #STG_TABLE_SCHEMA.f_change_credit_score_base;

INSERT INTO #STG_TABLE_SCHEMA.f_change_credit_score_base(row_id,department_key,task_type,assigned_to_key,created_on,created_by,changed_by,configuration_item_key,changed_on,assignment_group_key,source_id,business_service_key,application_key,task_key,opened_by_key,age,task_priority,caused_by_change_key,debit_score,task_duration,caused_by_change_closed_on_key,task_state)

-- major_incidents
select distinct concat('INC_MAJOR~',d_inc.row_id) as row_id, ic.department_key,'INC_MAJOR' as task_type, f_inc.assigned_to_key,f_inc.created_on, 
f_inc.created_by,f_inc.changed_by,f_inc.configuration_item_key,f_inc.changed_on,f_inc.assignment_group_key,f_inc.source_id,
 f_inc.business_service_key,f_inc.application_key,d_inc.row_key as task_key,null as opened_by_key,
 timestampdiff(second,coalesce(d_inc.due_on,d_inc.opened_on),od.lastupdated)/86400  as age,map.dimension_wh_code as task_priority,
 null as caused_by_change_key,
 CASE WHEN map.dimension_wh_code = 'CRITICAL' then COALESCE(p1_inc.dimension_code,0)
      WHEN map.dimension_wh_code = 'HIGH' then COALESCE(p2_inc.dimension_code,0)
      ELSE 0
END as debit_score,null as task_duration, null as caused_by_change_closed_on_key,f_inc.state_src_key as task_state
from (select * from #DWH_TABLE_SCHEMA.d_incident ) d_inc
left join (select * from #DWH_TABLE_SCHEMA.f_incident) f_inc
on f_inc.incident_key = d_inc.row_key
left join #DWH_TABLE_SCHEMA.d_internal_contact ic
on f_inc.opened_by_key = ic.row_key
join #DWH_TABLE_SCHEMA.f_caused_by_change cc -- join used to get only the matching records for caused by change
on cc.incident_key = f_inc.incident_key
left join (select source_id,max(lastupdated) as lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness group by source_id) od
on f_inc.source_id = od.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map map
on map.dimension_class = 'PRIORITY~INCIDENT' and d_inc.priority_src_key=map.src_key
left join #DWH_TABLE_SCHEMA.d_lov_map st
on st.dimension_class = 'STATE~INCIDENT' and d_inc.state_src_key=st.src_key
left join #DWH_TABLE_SCHEMA.d_lov p1_inc
on p1_inc.dimension_class = 'WH_MAJOR_INCIDENT_P1_AGE~POINTS_BUCKET' 
and timestampdiff(second,coalesce(d_inc.due_on,d_inc.opened_on),od.lastupdated)/86400 between p1_inc.lower_range_value and p1_inc.upper_range_value
left join #DWH_TABLE_SCHEMA.d_lov p2_inc
on p2_inc.dimension_class = 'WH_MAJOR_INCIDENT_P2_AGE~POINTS_BUCKET' 
and timestampdiff(second,coalesce(d_inc.due_on,d_inc.opened_on),od.lastupdated)/86400 between p2_inc.lower_range_value and p2_inc.upper_range_value
where map.dimension_wh_code IN ('CRITICAL','HIGH') and st.dimension_wh_code = 'OPEN'
and timestampdiff(second,coalesce(d_inc.due_on,d_inc.opened_on),od.lastupdated)/86400 between 0 and 150 
-- major_incidents 			
union
-- minor_incidents
select distinct concat('INC_MINOR~',d_inc.row_id) as row_id, ic.department_key,'INC_MINOR' as task_type, f_inc.assigned_to_key,f_inc.created_on, 
f_inc.created_by,f_inc.changed_by,f_inc.configuration_item_key,f_inc.changed_on,f_inc.assignment_group_key,f_inc.source_id,
 f_inc.business_service_key,f_inc.application_key,d_inc.row_key as task_key,null as opened_by_key,
 timestampdiff(second,coalesce(d_inc.due_on,d_inc.opened_on),od.lastupdated)/86400  as age,map.dimension_wh_code as priority,
 null as caused_by_change_key,
 CASE WHEN map.dimension_wh_code = 'LOW' then COALESCE(p3_inc.dimension_code,0)
      ELSE 0
END as debit_score,null as task_duration, null as caused_by_change_closed_on_key,f_inc.state_src_key as task_state
from (select * from #DWH_TABLE_SCHEMA.d_incident ) d_inc
left join (select * from #DWH_TABLE_SCHEMA.f_incident) f_inc
on f_inc.incident_key = d_inc.row_key
join #DWH_TABLE_SCHEMA.f_caused_by_change cc
on cc.incident_key = f_inc.incident_key
left join #DWH_TABLE_SCHEMA.d_internal_contact ic
on f_inc.opened_by_key = ic.row_key
left join (select source_id,max(lastupdated) as lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness group by source_id) od
on f_inc.source_id = od.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map map
on map.dimension_class = 'PRIORITY~INCIDENT' and d_inc.priority_src_key=map.src_key
left join #DWH_TABLE_SCHEMA.d_lov_map st
on st.dimension_class = 'STATE~INCIDENT' and d_inc.state_src_key=st.src_key
left join #DWH_TABLE_SCHEMA.d_lov p3_inc
on p3_inc.dimension_class = 'WH_MAJOR_INCIDENT_P3_AGE~POINTS_BUCKET' 
and timestampdiff(second,coalesce(d_inc.due_on,d_inc.opened_on),od.lastupdated)/86400 between p3_inc.lower_range_value and p3_inc.upper_range_value
where map.dimension_wh_code IN ('MEDIUM','LOW') and st.dimension_wh_code = 'OPEN'
and timestampdiff(second,coalesce(d_inc.due_on,d_inc.opened_on),od.lastupdated)/86400 between 0 and 150   		
-- minor_incidents
union
-- overdue_problems
select distinct concat('PRB_TASK~',prob.row_id) as row_id, ic.department_key, 'PRB_TASK' as task_type,f_pro.assigned_to_key,
 f_pro.created_on,f_pro.created_by,f_pro.changed_by,f_pro.configuration_item_key, f_pro.changed_on, f_pro.assignment_group_key,
 f_pro.source_id, f_pro.business_service_key, f_pro.application_key,prob.row_key as task_key, null as opened_by_key, 
 f_pro.overdue_duration/86400 as age, lov_map.dimension_wh_code as task_priority,null as caused_by_change_key, 
 COALESCE(p_prob.dimension_code,0) as debit_score,
null as task_duration, null as caused_by_change_closed_on_key,f_pro.state_src_key as task_state
from (select * from #DWH_TABLE_SCHEMA.d_problem_task) prob
left join #DWH_TABLE_SCHEMA.f_problem_task f_pro
on f_pro.row_id = prob.row_id
and f_pro.source_id = prob.source_id
join #DWH_TABLE_SCHEMA.f_caused_by_change cc
on cc.problem_key = f_pro.problem_key
left join #DWH_TABLE_SCHEMA.d_lov_map lov_map
on lov_map.dimension_class = 'PRIORITY~PROBLEM_TASK' and 
f_pro.priority_src_key=lov_map.src_key
left join #DWH_TABLE_SCHEMA.d_lov_map st
on f_pro.state_src_key=st.src_key
left join #DWH_TABLE_SCHEMA.d_internal_contact ic
on f_pro.opened_by_key = ic.row_key
left join #DWH_TABLE_SCHEMA.d_lov p_prob
on p_prob.dimension_class = 'WH_PROBLEM_PRIORITY~POINTS_BUCKET' 
and p_prob.dimension_name = lov_map.dimension_wh_code
left join (select source_id,max(lastupdated) as lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness group by source_id) od
on f_pro.source_id = od.source_id
where lov_map.dimension_wh_code in ('HIGH','MEDIUM','LOW') and prob.over_due_flag = 'Y'
and st.dimension_wh_code = 'OPEN' 	
-- overdue_problems																			
union
-- overdue_changes
select distinct concat('CHG_OVERDUE~',chg.row_id) as row_id, ic.department_key, 'CHG_OVERDUE' as task_type, f.assigned_to_key,f.created_on, f.created_by,f.changed_by,f.configuration_item_key,f.changed_on,f.assignment_group_key,f.source_id,f.business_service_key,
f.application_key,chg.row_key as task_key, null as opened_by_key, timestampdiff(second,COALESCE(chg.due_on,chg.planned_end_on),od.lastupdated)/86400 as age, lov_map.dimension_wh_code as task_priority,null as caused_by_change_key, COALESCE(p_chg.dimension_code,0) as debit_score,
null as task_duration, null as caused_by_change_closed_on_key,f.state_src_key as task_state
from (select * from #DWH_TABLE_SCHEMA.d_change_request ) chg
left join #DWH_TABLE_SCHEMA.f_change_request f
on f.change_request_key = chg.row_key 
left join #DWH_TABLE_SCHEMA.d_internal_contact ic
on f.opened_by_key = ic.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map st
on f.state_src_key=st.src_key 
left join #DWH_TABLE_SCHEMA.d_lov_map lov_map
on lov_map.dimension_class = 'PRIORITY~CHANGE_REQUEST' and 
f.priority_src_key=lov_map.src_key
left join #DWH_TABLE_SCHEMA.d_lov p_chg
on p_chg.dimension_class = 'WH_OVERDUE_CHANGES~POINTS_BUCKET' 
and p_chg.dimension_name = lov_map.dimension_wh_code
left join (select source_id,max(lastupdated) as lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness group by source_id) od
on chg.source_id = od.source_id
where st.dimension_wh_code = 'OPEN'
and coalesce(chg.due_on,chg.planned_end_on) < od.lastupdated
and timestampdiff(second,COALESCE(chg.due_on,chg.planned_end_on),od.lastupdated)/86400 between 0 and 100	
-- overdue_changes																			
union
-- emergency_changes
select distinct concat('CHG_CT~',chg.row_id) as row_id, ic.department_key, 'CHG_CT' as task_type, f.assigned_to_key,f.created_on, f.created_by,f.changed_by,f.configuration_item_key,f.changed_on,f.assignment_group_key,f.source_id,f.business_service_key,
f.application_key,chg.row_key as task_key, null as opened_by_key, timestampdiff(second,COALESCE(chg.due_on,chg.planned_end_on),od.lastupdated)/86400 as age, null as caused_by_change_key,lov_map.dimension_wh_code as priority, COALESCE(p_chg.dimension_code,0) as debit_score,
null as task_duration, null as caused_by_change_closed_on_key,f.state_src_key as task_state
from (select * from #DWH_TABLE_SCHEMA.d_change_request where change_type_normal_to_emergency_flag = 'Y') chg
left join #DWH_TABLE_SCHEMA.f_change_request f
on f.change_request_key = chg.row_key 
left join #DWH_TABLE_SCHEMA.d_internal_contact ic
on f.opened_by_key = ic.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map st
on f.state_src_key=st.src_key
left join #DWH_TABLE_SCHEMA.d_lov_map lov_map
on lov_map.dimension_class = 'PRIORITY~CHANGE_REQUEST' and 
f.priority_src_key=lov_map.src_key
left join #DWH_TABLE_SCHEMA.d_lov p_chg
on p_chg.dimension_class = 'WH_CHANGE_TYPE~POINTS_BUCKET' 
and p_chg.dimension_name = 'EMERGENCY'
and p_chg.dimension_name = lov_map.dimension_wh_code
left join (select source_id,max(lastupdated) as lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness group by source_id) od
on chg.source_id = od.source_id
left join #DWH_TABLE_SCHEMA.d_calendar_date curr_month
on  DATE_FORMAT(chg.opened_on,'%Y%m%d') = curr_month.row_key
where curr_month.lagging_count_of_month = 0 and st.dimension_wh_code = 'OPEN'
-- emergency_changes																			