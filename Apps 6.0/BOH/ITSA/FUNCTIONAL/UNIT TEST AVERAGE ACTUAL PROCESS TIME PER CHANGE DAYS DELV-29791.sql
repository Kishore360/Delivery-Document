SELECT DISTINCT IFF(1=1,'SUCCESS','FAILURE') AS Result,
IFF(1=1,'SUCCESS','MDS to DWH data validation failed for f_incident_change_summary_c.average_actual_process_time_per_change_days_c') as Message
FROM mdw.f_incident_change_summary_c TRGT
WHERE (SELECT AVG(actual_process_time_c) FROM mdw.f_change_request WHERE scheduled_process_time_c IS NOT NULL AND actual_process_time_c IS NOT NULL) <> (TRGT.average_actual_process_time_per_change_days_c) and TRGT.soft_deleted_flag ='N';