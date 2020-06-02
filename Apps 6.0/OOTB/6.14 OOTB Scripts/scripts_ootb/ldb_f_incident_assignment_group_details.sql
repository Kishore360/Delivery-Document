
SELECT t.source_id, (t.primary_sequence_id + 1) AS sequence_id, t.task_key AS incident_key, t.created_on_key AS assigned_on_key, CASE WHEN (t.task_attribute_wh_new_value IS NOT NULL) THEN COALESCE(assg.row_key, (-1)) ELSE (0) END AS assignment_group_key, f.opened_on_key, t.primary_duration AS assigned_duration FROM ((#DWH_TABLE_SCHEMA.f_incident_activity t JOIN #DWH_TABLE_SCHEMA.f_incident f ON ((((t.task_key = f.incident_key) AND (f.soft_deleted_flag = 'N')) AND (t.soft_deleted_flag = 'N')))) LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_organization assg ON ((((((t.task_attribute_wh_new_value) = (assg.row_id)) AND (t.source_id = assg.source_id)) AND (t.created_on >= assg.effective_from)) AND (t.created_on <= assg.effective_to)))) WHERE (((t.task_wh_type) = 'incident') AND ((t.task_attribute_wh_name) = 'assignment_group'));
