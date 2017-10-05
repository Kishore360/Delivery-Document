
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.reopened_count' 
ELSE 'MDS to DWH data validation passed for f_incident.reopened_count' END as Message from 
(select count(1) cnt 
FROM schneider_mdsdb.hpd_help_desk_final SRC 
JOIN schneider_mdwdb.f_incident TRGT 
ON SRC.entry_id = TRGT.row_id 
and  SRC.sourceinstance = TRGT.source_id   and TRGT.soft_deleted_flag = 'N'
WHERE coalesce ( substring_index( SRC.kickback_count,'.',1), '') <> COALESCE(TRGT.reopened_count ,''))b
