SELECT DISTINCT IFF(1= 1,'SUCCESS','FAILURE') AS Result,
IFF(1= 1,'SUCCESS','MDS to DWH data validation failed for f_incident_change_summary_c.total_number_of_incidents_c') as Message
FROM mdw.f_incident_change_summary_c TRGT
WHERE (SELECT COUNT(incident_number) FROM mdw.f_incident) <> (TRGT.total_number_of_incidents_c) and TRGT.soft_deleted_flag ='N';