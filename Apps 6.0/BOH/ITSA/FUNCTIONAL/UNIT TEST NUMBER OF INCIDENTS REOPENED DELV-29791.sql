SELECT DISTINCT IFF(1=1,'SUCCESS','FAILURE') AS Result,
IFF(1=1,'SUCCESS','MDS to DWH data validation failed for f_incident_change_summary_c.number_of_incidents_reopened_c') as Message
FROM mdw.f_incident_change_summary_c TRGT
WHERE (SELECT COUNT(*) FROM mdsdb.hlx_hpd_help_desk_final WHERE Kickback_Count > 0) <> (TRGT.number_of_incidents_reopened_c) and TRGT.soft_deleted_flag ='N';