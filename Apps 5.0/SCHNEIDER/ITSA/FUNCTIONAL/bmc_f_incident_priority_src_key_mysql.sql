
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.priority_src_key' 
ELSE 'MDS to DWH data validation passed for f_incident.priority_src_key' END as Message from 
(select count(1) cnt 
FROM schneider_mdsdb.hpd_help_desk_final SRC 
JOIN schneider_mdwdb.f_incident TRGT 
ON SRC.entry_id = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id  
LEFT JOIN schneider_mdwdb.d_lov LKP 
ON ( concat('PRIORITY','~','INCIDENT','~','~','~',upper(SRC.priority))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )   and TRGT.soft_deleted_flag = 'N'
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 else -1 end) <> (TRGT.priority_src_key))b
