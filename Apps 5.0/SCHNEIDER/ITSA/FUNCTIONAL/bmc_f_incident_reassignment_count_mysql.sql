
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.reassignment_count' 
ELSE 'MDS to DWH data validation passed for f_incident.reassignment_count' END as Message from 
(select count(1) cnt 
FROM schneider_mdsdb.hpd_help_desk_final SRC 
JOIN schneider_mdwdb.f_incident TRGT 
ON SRC.entry_id = TRGT.row_id 
and  SRC.sourceinstance = TRGT.source_id 
WHERE COALESCE(substring_index( SRC.group_transfers,'.',1),'') <> COALESCE(TRGT.reassignment_count ,''))b;

 

