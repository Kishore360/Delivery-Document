SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_credit_score.assigned_to_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM (select distinct concat('INC_MAJOR~',d_inc.row_id) as row_id, ic.department_key,'INC_MAJOR' as task_type, f_inc.assigned_to_key,f_inc.created_on, 
f_inc.created_by,f_inc.changed_by,f_inc.configuration_item_key,f_inc.changed_on,f_inc.assignment_group_key,f_inc.source_id,
 f_inc.business_service_key,f_inc.application_key,d_inc.row_key as task_key,null as opened_by_key,
 timestampdiff(second,coalesce(d_inc.due_on,d_inc.opened_on),od.lastupdated)/86400  as age,map.dimension_wh_code as task_priority,
 null as caused_by_change_key,
 CASE WHEN map.dimension_wh_code = 'CRITICAL' then COALESCE(p1_inc.dimension_code,0)
      WHEN map.dimension_wh_code = 'HIGH' then COALESCE(p2_inc.dimension_code,0)
      ELSE 0
END as debit_score,null as task_duration, null as caused_by_change_closed_on_key,f_inc.state_src_key as task_state
from (select * from ge_mdwdb.d_incident ) d_inc
left join (select * from ge_mdwdb.f_incident) f_inc
on f_inc.incident_key = d_inc.row_key
left join ge_mdwdb.d_internal_contact ic
on f_inc.opened_by_key = ic.row_key
join ge_mdwdb.f_caused_by_change cc -- join used to get only the matching records for caused by change
on cc.incident_key = f_inc.incident_key
left join (select source_id,max(lastupdated) as lastupdated from ge_mdwdb.d_o_data_freshness group by source_id) od
on f_inc.source_id = od.source_id
left join ge_mdwdb.d_lov_map map
on map.dimension_class = 'PRIORITY~INCIDENT' and d_inc.priority_src_key=map.src_key
left join ge_mdwdb.d_lov_map st
on st.dimension_class = 'STATE~INCIDENT' and d_inc.state_src_key=st.src_key
left join ge_mdwdb.d_lov p1_inc
on p1_inc.dimension_class = 'WH_MAJOR_INCIDENT_P1_AGE~POINTS_BUCKET' 
and timestampdiff(second,coalesce(d_inc.due_on,d_inc.opened_on),od.lastupdated)/86400 between p1_inc.lower_range_value and p1_inc.upper_range_value
left join ge_mdwdb.d_lov p2_inc
on p2_inc.dimension_class = 'WH_MAJOR_INCIDENT_P2_AGE~POINTS_BUCKET' 
and timestampdiff(second,coalesce(d_inc.due_on,d_inc.opened_on),od.lastupdated)/86400 between p2_inc.lower_range_value and p2_inc.upper_range_value
where map.dimension_wh_code IN ('CRITICAL','HIGH') and st.dimension_wh_code = 'OPEN'
and timestampdiff(second,coalesce(d_inc.due_on,d_inc.opened_on),od.lastupdated)/86400 between 0 and 120 
-- major_incidents 			
union
-- minor_incidents
select distinct concat('INC_MINOR~',d_inc.row_id) as row_id, ic.department_key,'INC_MINOR' as task_type, f_inc.assigned_to_key,f_inc.created_on, 
f_inc.created_by,f_inc.changed_by,f_inc.configuration_item_key,f_inc.changed_on,f_inc.assignment_group_key,f_inc.source_id,
 f_inc.business_service_key,f_inc.application_key,d_inc.row_key as task_key,null as opened_by_key,
 timestampdiff(second,coalesce(d_inc.due_on,d_inc.opened_on),od.lastupdated)/86400  as age,map.dimension_wh_code as priority,
 null as caused_by_change_key,
 CASE WHEN map.dimension_wh_code IN ('MEDIUM','LOW') then COALESCE(p3_inc.dimension_code,0)
      ELSE 0
END as debit_score,null as task_duration, null as caused_by_change_closed_on_key,f_inc.state_src_key as task_state
from (select * from ge_mdwdb.d_incident ) d_inc
left join (select * from ge_mdwdb.f_incident) f_inc
on f_inc.incident_key = d_inc.row_key
join ge_mdwdb.f_caused_by_change cc
on cc.incident_key = f_inc.incident_key
left join ge_mdwdb.d_internal_contact ic
on f_inc.opened_by_key = ic.row_key
left join (select source_id,max(lastupdated) as lastupdated from ge_mdwdb.d_o_data_freshness group by source_id) od
on f_inc.source_id = od.source_id
left join ge_mdwdb.d_lov_map map
on map.dimension_class = 'PRIORITY~INCIDENT' and d_inc.priority_src_key=map.src_key
left join ge_mdwdb.d_lov_map st
on st.dimension_class = 'STATE~INCIDENT' and d_inc.state_src_key=st.src_key
left join ge_mdwdb.d_lov p3_inc
on p3_inc.dimension_class = 'WH_MINOR_INCIDENT_AGE~POINTS_BUCKET' 
and timestampdiff(second,coalesce(d_inc.due_on,d_inc.opened_on),od.lastupdated)/86400 > p3_inc.lower_range_value 
and timestampdiff(second,coalesce(d_inc.due_on,d_inc.opened_on),od.lastupdated)/86400 <= p3_inc.upper_range_value
where map.dimension_wh_code IN ('MEDIUM','LOW') and st.dimension_wh_code = 'OPEN'
and timestampdiff(second,coalesce(d_inc.due_on,d_inc.opened_on),od.lastupdated)/86400 between 0 and 120   		
-- minor_incidents
union
-- overdue_problem_task
select distinct concat('PRB_TASK~',prob.row_id) as row_id, ic.department_key, 'PRB_TASK' as task_type,f_pro.assigned_to_key,
 f_pro.created_on,f_pro.created_by,f_pro.changed_by,f_pro.configuration_item_key, f_pro.changed_on, f_pro.assignment_group_key,
 f_pro.source_id, f_pro.business_service_key, f_pro.application_key,prob.row_key as task_key, null as opened_by_key, 
 f_pro.overdue_duration/86400 as age, lov_map.dimension_wh_code as task_priority,null as caused_by_change_key, 
 COALESCE(p_prob.dimension_code,0) as debit_score,
null as task_duration, null as caused_by_change_closed_on_key,f_pro.state_src_key as task_state
from (select * from ge_mdwdb.d_problem_task) prob
left join ge_mdwdb.f_problem_task f_pro
on f_pro.row_id = prob.row_id
and f_pro.source_id = prob.source_id
join (select distinct problem_key from ge_mdwdb.f_caused_by_change where problem_key > 0)cc
on cc.problem_key = f_pro.problem_key
left join ge_mdwdb.d_lov_map lov_map
on lov_map.dimension_class = 'PRIORITY~PROBLEM_TASK' and 
f_pro.priority_src_key=lov_map.src_key
left join ge_mdwdb.d_lov_map st
on f_pro.state_src_key=st.src_key
left join ge_mdwdb.d_internal_contact ic
on f_pro.opened_by_key = ic.row_key
left join ge_mdwdb.d_lov p_prob
on p_prob.dimension_class = 'WH_PROBLEM_PRIORITY~POINTS_BUCKET' 
and p_prob.dimension_name = lov_map.dimension_wh_code
left join (select source_id,max(lastupdated) as lastupdated from ge_mdwdb.d_o_data_freshness group by source_id) od
on f_pro.source_id = od.source_id
where lov_map.dimension_wh_code in ('HIGH','MEDIUM','LOW') and prob.over_due_flag = 'Y'
and st.dimension_wh_code = 'OPEN' 	
-- overdue_problems																			
union
-- overdue_changes
select distinct concat('CHG_OVERDUE~',chg.row_id) as row_id, ic.department_key, 'CHG_OVERDUE' as task_type, f.assigned_to_key,f.created_on, f.created_by,f.changed_by,f.configuration_item_key,f.changed_on,f.assignment_group_key,f.source_id,f.business_service_key,
f.application_key,chg.row_key as task_key, null as opened_by_key, timestampdiff(second,COALESCE(chg.due_on,chg.planned_end_on),od.lastupdated)/86400 as age, f.priority_src_key as task_priority,null as caused_by_change_key, COALESCE(p_chg.dimension_code,0) as debit_score,
null as task_duration, null as caused_by_change_closed_on_key,f.state_src_key as task_state
from (select * from ge_mdwdb.d_change_request ) chg
left join ge_mdwdb.f_change_request f
on f.change_request_key = chg.row_key 
left join ge_mdwdb.d_internal_contact ic
on f.opened_by_key = ic.row_key
left join ge_mdwdb.d_lov_map st
on f.state_src_key=st.src_key 
left join ge_mdwdb.d_lov_map lov_map
on lov_map.dimension_class = 'PRIORITY~CHANGE_REQUEST' and 
f.priority_src_key=lov_map.src_key
left join ge_mdwdb.d_lov p_chg
on p_chg.dimension_class = 'WH_OVERDUE_CHANGES~POINTS_BUCKET' 
left join (select source_id,max(lastupdated) as lastupdated from ge_mdwdb.d_o_data_freshness group by source_id) od
on chg.source_id = od.source_id
where st.dimension_wh_code = 'OPEN'
and coalesce(chg.due_on,chg.planned_end_on) < od.lastupdated
and timestampdiff(second,COALESCE(chg.due_on,chg.planned_end_on),od.lastupdated)/86400 between 0 and 90	
and timestampdiff(second,COALESCE(chg.due_on,chg.planned_end_on),od.lastupdated)/86400 > p_chg.lower_range_value and 
timestampdiff(second,COALESCE(chg.due_on,chg.planned_end_on),od.lastupdated)/86400 <= p_chg.upper_range_value
-- overdue_changes																			
union
-- emergency_changes
select distinct concat('CHG_CT~',chg.row_id) as row_id, ic.department_key, 'CHG_CT' as task_type, f.assigned_to_key,
f.created_on, f.created_by,f.changed_by,f.configuration_item_key,f.changed_on,f.assignment_group_key,
f.source_id,f.business_service_key,f.application_key,chg.row_key as task_key, null as opened_by_key,null as age, f.priority_src_key as task_priority, null as caused_by_change_key, COALESCE(p_chg.dimension_code,0) as debit_score,
null as task_duration, null as caused_by_change_closed_on_key,f.state_src_key as task_state
from (select * from ge_mdwdb.d_change_request where change_type_normal_to_emergency_flag = 'Y') chg
left join ge_mdwdb.f_change_request f
on f.change_request_key = chg.row_key 
left join ge_mdwdb.d_internal_contact ic
on f.opened_by_key = ic.row_key
left join ge_mdwdb.d_lov_map st
on f.state_src_key=st.src_key
left join ge_mdwdb.d_lov_map lov_map
on lov_map.dimension_class = 'PRIORITY~CHANGE_REQUEST' and 
f.priority_src_key=lov_map.src_key
left join ge_mdwdb.d_lov p_chg
on p_chg.dimension_class = 'WH_CHANGE_TYPE~POINTS_BUCKET' 
and p_chg.dimension_name = 'EMERGENCY'
left join (select source_id,max(lastupdated) as lastupdated from ge_mdwdb.d_o_data_freshness group by source_id) od
on chg.source_id = od.source_id
left join ge_mdwdb.d_calendar_date curr_month
on  DATE_FORMAT(chg.opened_on,'%Y%m%d') = curr_month.row_key
where curr_month.lagging_count_of_month = 0 and st.dimension_wh_code = 'OPEN')a) SRC 
 LEFT JOIN ge_mdwdb.f_change_credit_score TRGT 
 ON (SRC.row_id=TRGT.row_id AND SRC.source_id=TRGT.source_id AND SRC.task_type = TRGT.task_type)
 where COALESCE( SRC.assigned_to_key,'')= COALESCE(TRGT.assigned_to_key,'')
