SELECT 
CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_outage.external_impacted_count_c' ELSE 'SUCCESS' END as Message 
FROM fidelity_mdsdb.cmdb_ci_outage_final  SRC 
JOIN fidelity_mdwdb.f_outage TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  
WHERE CASE 
WHEN SRC.u_total_impact_duration is null  THEN NULL   
WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.u_total_impact_duration) < 0  THEN NULL    
WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.u_total_impact_duration) > 214748364  THEN NULL     
ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.u_total_impact_duration) end <> (TRGT.primary_impact_duration_c) 
