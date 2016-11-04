SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.backlog_flag' ELSE 'SUCCESS' END as Message
 FROM
pan_mdwdb.d_incident_tasks_c a 
JOIN  pan_mdwdb.f_incident_tasks_c b 
ON     a.row_key=b.incident_tasks_c_key 
AND    a.source_id=b.source_id 
JOIN   pan_mdwdb.d_lov_map c 
ON     a.state_src_key=c.src_key 
JOIN  pan_mdwdb.o_data_freshness fresh
on    fresh.source_id = b.source_id
WHERE (case when timestampdiff(day,a.changed_on,fresh.lastupdated)>30
AND    c.dimension_wh_code='OPEN' then 'Y' else 'N' end)<>a.dormant_flag;

