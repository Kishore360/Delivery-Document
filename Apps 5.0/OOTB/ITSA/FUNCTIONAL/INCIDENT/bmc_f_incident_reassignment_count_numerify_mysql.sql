

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.reassignment_count_numerify' ELSE 'SUCCESS' END as Message from 
 (select count(1) cnt 
 FROM schneider_mdsdb.hp_help_desk_final SRC 
JOIN schneider_mdwdb.f_incident TRGT 
ON SRC.incident_number = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id
JOIN schneider_mdwdb.d_incident LKP 
ON LKP.row_key = TRGT.incident_key
left join  (select sourceinstance, documentkey, count(1) as cnt from schneider_mdsdb.sys_audit_final 
where fieldname= 'assignment_group' and tablename= 'incident' and oldvalue is not NULL 
group by sourceinstance, documentkey) sd
on sd.documentkey=LKP.row_id and sd.sourceinstance=LKP.source_id
where  coalesce(sd.cnt,0)  <> COALESCE(TRGT.reassignment_count_numerify ,''))b
