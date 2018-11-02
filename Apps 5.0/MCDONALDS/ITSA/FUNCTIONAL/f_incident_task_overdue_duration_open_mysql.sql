SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_task.overdue_duration' ELSE 'SUCCESS' END as Message
 from
 mcdonalds_mdwdb.f_incident_task f 
join mcdonalds_mdwdb.d_incident_task d on d.row_key = f.incident_task_key
JOIN mcdonalds_mdwdb.d_lov_map br ON f.state_src_key = br.src_key and br.dimension_wh_code='OPEN' and d.over_due_flag='Y'
join (select max(lastupdated) as last_updated,source_id from mcdonalds_mdwdb.d_o_data_freshness group by 2) dat on f.source_id = dat.source_id
where f.overdue_duration <>  case when dat.last_updated > d.due_on then TIMESTAMPDIFF(SECOND,d.due_on,dat.last_updated) else 0 end
 ;
 
 
