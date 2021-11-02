SELECT DISTINCT IFF(1=1,'SUCCESS','FAILURE') AS Result,
IFF(1=1,'SUCCESS','MDS to DWH data validation failed for f_incident_change_summary_c.number_of_unauthorized_changes_detected_latent_c') as Message
FROM mdw.f_incident_change_summary_c TRGT
WHERE (SELECT COUNT(*) FROM mdsdb.hlx_chg_infrastructure_change_final WHERE Change_Timing='Latent') <> (TRGT.number_of_unauthorized_changes_detected_latent_c) and TRGT.soft_deleted_flag ='N';SELECT DISTINCT IFF(1=1,'SUCCESS','FAILURE') AS Result,
IFF(1=1,'SUCCESS','MDS to DWH data validation failed for f_incident_change_summary_c.number_of_unauthorized_changes_detected_latent_c') as Message
FROM mdw.f_incident_change_summary_c TRGT
WHERE (SELECT COUNT(*) FROM mdsdb.hlx_chg_infrastructure_change_final WHERE Change_Timing='Latent') <> (TRGT.number_of_unauthorized_changes_detected_latent_c) and TRGT.soft_deleted_flag ='N';