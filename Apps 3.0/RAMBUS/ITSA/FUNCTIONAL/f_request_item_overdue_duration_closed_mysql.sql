SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.OPEN_TO_CLOSE_DURATION' ELSE 'SUCCESS' END as Message
 from
 rambus_mdwdb.f_request_item f 
join rambus_mdwdb.d_request_item d on d.row_id = f.row_id
JOIN rambus_mdwdb.d_lov_map br ON f.state_src_key = br.src_key and br.dimension_wh_code='CLOSED'
join rambus_mdwdb.d_o_data_freshness dat on f.source_id = dat.source_id
where f.overdue_duration <>  case when d.closed_on > d.due_on then TIMESTAMPDIFF(SECOND,d.due_on,d.closed_on) else 0 end
 ;