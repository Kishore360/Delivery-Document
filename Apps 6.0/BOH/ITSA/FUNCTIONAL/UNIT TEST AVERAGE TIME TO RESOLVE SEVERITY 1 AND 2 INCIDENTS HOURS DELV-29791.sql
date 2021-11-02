SELECT DISTINCT IFF(1=1,'SUCCESS','FAILURE') AS Result,
IFF(1=1,'SUCCESS','MDS to DWH data validation failed for f_incident_change_summary_c.average_time_to_resolve_severity_1_and_2_incidents_hours_c') as Message
FROM mdw.f_incident_change_summary_c TRGT
WHERE (SELECT AVG(CASE WHEN Last_Resolved_Date is not null THEN (TIMESTAMPDIFF(SECOND,transientdb.SQL_CONVERT_TZ(Submit_Date,'GMT','Pacific/Honolulu'),
                  transientdb.SQL_CONVERT_TZ(Last_Resolved_Date,'GMT','Pacific/Honolulu'))) END)
       FROM mdsdb.hlx_hpd_help_desk_final WHERE Priority IN ('Critical','High') AND Status IN ('Resolved','Closed')) <> (TRGT.average_time_to_resolve_severity_1_and_2_incidents_hours_c) and TRGT.soft_deleted_flag ='N';