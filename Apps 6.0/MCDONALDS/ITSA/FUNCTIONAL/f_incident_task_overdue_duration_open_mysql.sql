SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_task.overdue_duration' ELSE 'SUCCESS' END as Message
 from
 mcd_mdwdb.f_incident_task_c f 
join mcd_mdwdb.d_incident_task_c d on d.row_key = f.incident_task_c_key
JOIN mcd_mdwdb.d_lov_map br ON f.incident_task_c_key = br.src_key and br.dimension_wh_code='OPEN' 
join (select max(lastupdated) as last_updated,source_id from mcd_mdwdb.d_o_data_freshness group by 2) dat on f.source_id = dat.source_id
where f.overdue_duration <>  case when dat.last_updated > d.due_on then TIMESTAMPDIFF(SECOND,d.due_on,dat.last_updated) else 0 end
 ;