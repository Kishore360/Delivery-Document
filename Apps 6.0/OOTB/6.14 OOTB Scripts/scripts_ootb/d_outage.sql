
SELECT row_id, source_id,outage_number,outage_type_src_key,outage_type_src_code,
start_on,end_on,duration,message,linked_to_other_ci_flag,
change_on_same_ci_flag,linked_to_task_flag,linked_to_incident_flag,multiple_ci_flag,
incorrect_start_flag,no_message_flag,domain_key,created_by,changed_by,created_on,changed_on 
FROM #DWH_TABLE_SCHEMA.d_outage 
ORDER BY row_id, source_id,outage_number,outage_type_src_key,outage_type_src_code,
start_on,end_on,duration,message,linked_to_other_ci_flag,
change_on_same_ci_flag,linked_to_task_flag,linked_to_incident_flag,multiple_ci_flag,
incorrect_start_flag,no_message_flag,domain_key,created_by,changed_by,created_on,changed_on 