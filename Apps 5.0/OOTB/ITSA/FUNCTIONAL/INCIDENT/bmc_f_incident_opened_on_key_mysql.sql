

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' 
ELSE 'MDS to DWH data validation passed for f_incident.opened_on_key' END as Message from 
(select count(1) cnt 
FROM schneider_mdsdb.hp_help_desk_final SRC 
JOIN schneider_mdwdb.f_incident TRGT 
ON SRC.incident_number = TRGT.row_id 
and  SRC.sourceinstance = TRGT.source_id   and TRGT.soft_deleted_flag = 'N'
LEFT JOIN schneider_mdwdb.d_calendar_date LKP
 ON date_format(convert_tz(SRC.reported_date,'GMT','America/New_York'),'%Y%m%d')   = LKP.row_id
 where COALESCE(LKP.row_key,'') <> COALESCE(TRGT.opened_on_key,''))b