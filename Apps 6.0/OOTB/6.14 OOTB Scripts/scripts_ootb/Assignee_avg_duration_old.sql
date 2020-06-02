SELECT INC.full_name as new_assignee,
 concat(trim(to_char(round((avg (t.primary_duration / 3600.0 )),1), '9999999999D9')),' hours')  AS avg_duration_for_assignee
 FROM #DWH_TABLE_SCHEMA.f_incident F 
 left join #DWH_TABLE_SCHEMA.f_t_task_activity T on t.task_key = f.incident_key
 join #DWH_TABLE_SCHEMA.d_internal_contact inc on inc.row_key = (CASE
            WHEN t.task_attribute_wh_name::text = 'assignment_group'::text THEN 0::bigint
            ELSE t.task_attribute_wh_new_value_key
        END )
 join #DWH_TABLE_SCHEMA.d_calendar_date as cal on cal.row_key = t.created_on_key
 where cal.lagging_count_of_month between 0 and 12 
  AND f.soft_deleted_flag = 'N'::bpchar AND t.soft_deleted_flag = 'N'::bpchar
  and t.task_wh_type::text = 'incident'::text AND (t.task_attribute_wh_name::text = 'assigned_to'::text OR t.task_attribute_wh_name::text = 'assignment_group'::text)
 group by 1
 order by lower (INC.full_name)
