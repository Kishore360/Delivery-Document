
SELECT row_id,source_id,outage_key,task_key,transaction_key,transaction_type,changed_by,created_on,changed_on
FROM #DWH_TABLE_SCHEMA.f_outage_task 
ORDER BY row_id,source_id,outage_key,task_key,transaction_key,transaction_type,changed_by,created_on,changed_on
