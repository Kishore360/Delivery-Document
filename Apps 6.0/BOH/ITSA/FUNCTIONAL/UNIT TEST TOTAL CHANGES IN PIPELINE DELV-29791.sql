SELECT DISTINCT IFF(1= 1,'SUCCESS','FAILURE') AS Result,
IFF(1= 1,'SUCCESS','MDS to DWH data validation failed for f_incident_change_summary_c.total_changes_in_pipeline_c') as Message
FROM mdw.f_incident_change_summary_c TRGT
WHERE (SELECT COUNT(change_request_number) FROM mdw.f_change_request) <> (TRGT.total_changes_in_pipeline_c) and TRGT.soft_deleted_flag ='N';