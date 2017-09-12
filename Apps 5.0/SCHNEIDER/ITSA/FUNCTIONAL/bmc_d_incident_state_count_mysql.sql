SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.state_count' ELSE 'SUCCESS' END as Message from schneider_mdsdb.hpd_help_desk_final  SRC JOIN schneider_mdwdb.d_incident TRGT ON (SRC.incident_number = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
left join 
(select documentkey, sourceinstance, count(1) as cnt from schneider_workdb.hpd_help_desk_sys_audit 
where tablename='hpd_help_desk' and fieldname='Status'  and oldvalue is not NULL 
group by documentkey, sourceinstance) sd
on sd.documentkey=SRC.incident_number and sd.sourceinstance=SRC.sourceinstance
WHERE  coalesce(sd.cnt,0)  <> (TRGT.state_count) 
