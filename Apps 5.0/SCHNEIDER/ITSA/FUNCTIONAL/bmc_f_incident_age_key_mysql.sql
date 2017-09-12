
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.age_key' 
ELSE 'MDS to DWH data validation passed for f_incident.age_key' END as Message from 
(select count(1) cnt 
FROM schneider_mdsdb.hpd_help_desk_final SRC 
JOIN schneider_mdwdb.f_incident TRGT 
ON SRC.incident_number = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id  and TRGT.soft_deleted_flag='N'
LEFT JOIN schneider_mdwdb.d_lov LKP  
ON ((TRGT.age div 86400.0 BETWEEN LKP.lower_range_value AND LKP.upper_range_value)
	AND LKP.dimension_class = 'AGEBUCKET_WH~INCIDENT' )
WHERE (LKP.row_key )  <> TRGT.age_key)b; 