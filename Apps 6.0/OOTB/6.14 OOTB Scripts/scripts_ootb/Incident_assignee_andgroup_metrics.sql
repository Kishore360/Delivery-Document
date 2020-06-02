select f.row_key  AS incident,
ICO.full_name as Old_Assignee,
ICN.full_name as New_Assignee,
	max(case when DIO1.organization_name is null then 'UNSPECIFIED' else DIO1.organization_name end) AS old_assignment_group,
	max(case when DIO.organization_name is null then 'UNSPECIFIED' else DIO.organization_name end) AS new_assignment_group,
	 (CASE
            WHEN t.task_attribute_wh_name::text = 'assigned_to'::text THEN t.primary_sequence_id + 1
            ELSE NULL::integer
        END) AS Assignee_handoff_no,
		(CASE
            WHEN t.task_attribute_wh_name::text = 'assignment_group'::text THEN t.primary_sequence_id + 1
            ELSE NULL::integer
        END) AS Group_handoff_no,
		D.reassignee_count as Total_handoff_per_incident,
		D.reassignment_count_numerify as Total_reassignments_per_incident,
	D.reassignee_count as no_handoffs_assignee,
	D.reassignment_count_numerify as no_handoffs_assgrp
from #DWH_TABLE_SCHEMA.f_incident as f 
left join  #DWH_TABLE_SCHEMA.f_t_task_activity T on t.task_key = f.incident_key
left join  #DWH_TABLE_SCHEMA.d_incident D on D.row_key = f.incident_key
left join #DWH_TABLE_SCHEMA.d_internal_contact ICO
on ( CASE
            WHEN t.task_attribute_wh_name::text = 'assignment_group'::text THEN 0::bigint
            ELSE t.task_attribute_wh_old_value_key
        END= ICO.row_key)
 left join #DWH_TABLE_SCHEMA.d_internal_contact ICN
on  (CASE
            WHEN t.task_attribute_wh_name::text = 'assignment_group'::text THEN 0::bigint
            ELSE t.task_attribute_wh_new_value_key
        END= ICN.row_key)
  left join	#DWH_TABLE_SCHEMA.d_internal_organization	DIO
	  on 	( CASE
            WHEN t.task_attribute_wh_name::text = 'assigned_to'::text THEN 0::bigint
            ELSE t.task_attribute_wh_new_value_key
        END = DIO.row_key)
	left join	#DWH_TABLE_SCHEMA.d_internal_organization	DIO1
	  on 	( CASE
            WHEN t.task_attribute_wh_name::text = 'assigned_to'::text THEN 0::bigint
            ELSE t.task_attribute_wh_old_value_key
        END = DIO1.row_key)
  join #DWH_TABLE_SCHEMA.d_calendar_date as cal on cal.row_key = t.created_on_key
 and cal.lagging_count_of_month between 0 and 12 
AND t.soft_deleted_flag = 'N'::bpchar
  WHERE t.task_wh_type::text = 'incident'::text AND (t.task_attribute_wh_name::text = 'assigned_to'::text OR t.task_attribute_wh_name::text = 'assignment_group'::text)
  group by 1,2,3,6,7,8,9,t.primary_duration
  order by 1
 