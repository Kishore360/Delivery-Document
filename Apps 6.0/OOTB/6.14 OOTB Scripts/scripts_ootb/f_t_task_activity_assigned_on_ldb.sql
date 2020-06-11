select t.row_key as row_key,t.created_on  AS assigned_on,t.task_key AS incident_key
FROM itsa210hf2_mdwdb.f_t_task_activity t
   JOIN itsa210hf2_mdwdb.d_incident f 
   ON t.task_key = f.row_key AND f.soft_deleted_flag = 'N'::bpchar AND t.soft_deleted_flag = 'N'::bpchar
  WHERE t.task_wh_type::text = 'incident'::text 
  AND (t.task_attribute_wh_name::text = 'assigned_to'::text OR t.task_attribute_wh_name::text = 'assignment_group'::text)
group by t.row_key,t.created_on,t.task_key