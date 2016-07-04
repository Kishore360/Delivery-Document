
SELECT t.source_id, (t.primary_sequence_id + 1) AS sequence_id, t.task_key AS incident_key, t.created_on_key AS state_updated_on_key, CASE WHEN (t.task_attribute_wh_new_value IS NOT NULL) THEN COALESCE(st.row_key, (-1)) ELSE (0) END AS state_src_key, f.opened_on_key, f.priority_src_key, f.category_src_key, CASE WHEN ((sw.dimension_wh_code) = 'CLOSED') THEN 0 ELSE t.primary_duration END AS state_duration FROM (((<<tenant>>_mdwdb.f_incident_activity t JOIN <<tenant>>_mdwdb.f_incident f ON ((((t.task_key = f.incident_key) AND (f.soft_deleted_flag = 'N')) AND (t.soft_deleted_flag = 'N')))) LEFT JOIN <<tenant>>_mdwdb.d_lov st ON ((((st.dimension_class) = 'STATE~INCIDENT') AND ((t.task_attribute_wh_new_value) = (st.dimension_code))))) LEFT JOIN <<tenant>>_mdwdb.d_lov_map sw ON ((((((sw.src_key = st.row_key) AND ((sw.dimension_class) = 'STATE~INCIDENT')) AND (t.source_id = st.source_id)) AND (t.created_on >= st.effective_from)) AND (t.created_on <= st.effective_to)))) WHERE (((t.task_wh_type) = 'incident') AND ((t.task_attribute_wh_name) = 'state'));
