
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.reassignment_count' 
ELSE 'MDS to DWH data validation passed for f_incident.reassignment_count' END as Message from 
(select count(1) cnt 
FROM schneider_mdsdb.hpd_help_desk_final SRC 
JOIN schneider_mdwdb.f_incident TRGT 
ON SRC.incident_number = TRGT.row_id 
and  SRC.sourceinstance = TRGT.source_id   and TRGT.soft_deleted_flag = 'N'
left join 
(select documentkey, sourceinstance, count(1) as cnt from schneider_workdb.hpd_help_desk_sys_audit 
where tablename='hpd_help_desk' and fieldname='Assigned Group'  and oldvalue is not NULL and 
group by documentkey, sourceinstance) sd
on sd.documentkey=SRC.incident_number and sd.sourceinstance=SRC.sourceinstance
WHERE  coalesce(sd.cnt,0)
WHERE COALESCE( SRC.total_transfers,'') <> COALESCE(TRGT.reassignment_count ,''))b
