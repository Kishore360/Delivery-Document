SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_task.OPEN_TO_CLOSE_DURATION' ELSE 'SUCCESS' END as Message
 from
 mcd_mdwdb.f_incident_task_c f 
join mcd_mdwdb.d_incident_task_c d on d.row_id = f.row_id
JOIN mcd_mdwdb.d_lov_map br ON  br.dimension_wh_code='CLOSED' 
where f.overdue_duration <>  case when coalesce(d.closed_on,d.changed_on)  > d.due_on then TIMESTAMPDIFF(SECOND,d.due_on,d.closed_on) else 0 end
 ; 