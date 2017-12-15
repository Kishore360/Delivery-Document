SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_key' ELSE 'SUCCESS' END as Message
 from pan_mdwdb.f_request_item f
JOIN  pan_mdsdb.sc_req_item_final src on sys_id=row_id and sourceinstance=source_id
where  approval_to_close_duration_c<>
 timestampdiff(SECOND, CONVERT_TZ(src.approval_set,'GMT','America/Los_Angeles'), CONVERT_TZ(src.closed_at,'GMT','America/Los_Angeles'));
 
 
 