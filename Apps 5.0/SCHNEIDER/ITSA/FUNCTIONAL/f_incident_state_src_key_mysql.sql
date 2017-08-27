
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' 
ELSE 'MDS to DWH data validation passed for f_incident.state_src_key' END as Message
(select count(1) cnt 
FROM schneider_mdsdb.hp_help_desk_final SRC 
JOIN schneider_mdwdb.f_incident TRGT 
ON SRC.incident_number = TRGT.row_id 
and  SRC.sourceinstance = TRGT.source_id and TRGT.pivot_date between effective_from and effective_to and TRGT.soft_deleted_flag = 'N'
LEFT JOIN schneider_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%STATE~INCIDENT%' and 
( concat('STATE~INCIDENT~~~',upper(SRC.status))= LKP.row_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.status IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.state_src_key,''))b
