SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.impact_src_code' 
ELSE 'MDS to DWH data validation passed for f_incident.impact_src_code' END as Message from 
(select count(1) cnt 
FROM equifax_mdsdb.u_efx_application_final SRC 
JOIN equifax_mdwdb.d_efx_application_c TRGT 
ON SRC.sys_id = TRGT.row_id 
and  SRC.sourceinstance = TRGT.source_id  
WHERE COALESCE(SRC.u_data_classification_highest,'UNSPECIFIED') <> TRGT.data_classification_highest_c and SRC.cdctype<>'D')b
