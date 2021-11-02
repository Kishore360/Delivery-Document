SELECT DISTINCT IFF(1= 1,'SUCCESS','FAILURE') AS Result,
IFF(1= 1,'SUCCESS','MDS to DWH data validation failed for f_incident_change_summary_c.number_of_change_incident_pairs_c') as Message
FROM mdw.f_incident_change_summary_c TRGT
WHERE (SELECT COUNT(B.REQUEST_ID02)
FROM mdsdb.hlx_chg_infrastructure_change_final A
JOIN mdsdb.hlx_hpd_associations_final B
ON A.Infrastructure_Change_ID=B.REQUEST_ID01
WHERE B.FORM_NAME01='CHG:Infrastructure Change' AND (B.ASSOCIATION_TYPE01='Created' OR B.ASSOCIATION_TYPE01='Corrected by')) <> (TRGT.number_of_change_incident_pairs_c) and TRGT.soft_deleted_flag ='N';