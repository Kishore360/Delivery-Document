

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_incident.state_count' ELSE 'SUCCESS' END as Message from 
 (select count(1) cnt 
 FROM schneider_mdsdb.hpd_help_desk_final SRC 
JOIN schneider_mdwdb.d_incident TRGT 
ON SRC.incident_number = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id
left join  (select sourceinstance, documentkey, count(1) as cnt from schneider_mdsdb.hpd_help_desk_sys_audit 
where fieldname= 'state' and tablename= 'incident' 
group by sourceinstance, documentkey) sd
on sd.documentkey=TRGT.incident_number and sd.sourceinstance=TRGT.source_id
where  coalesce(sd.cnt,0)  <> TRGT.state_count)b
