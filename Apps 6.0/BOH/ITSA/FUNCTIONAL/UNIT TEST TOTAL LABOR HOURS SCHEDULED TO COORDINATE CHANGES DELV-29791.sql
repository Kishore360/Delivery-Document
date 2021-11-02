SELECT DISTINCT IFF(1=1,'SUCCESS','FAILURE') AS Result,
IFF(1=1,'SUCCESS','MDS to DWH data validation failed for f_incident_change_summary_c.total_labor_hours_scheduled_to_coordinate_changes_c') as Message
FROM mdw.f_incident_change_summary_c TRGT
WHERE (SELECT SUM(scheduled_process_time_c) FROM mdw.f_change_request WHERE actual_process_time_c IS NOT NULL) <> (TRGT.total_labor_hours_scheduled_to_coordinate_changes_c) and TRGT.soft_deleted_flag ='N';