
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_key' ELSE 'SUCCESS' END as Message
 from paloalto_mdwdb.f_request_item f
JOIN  paloalto_mdsdb.sc_req_item_final src on sys_id=row_id and sourceinstance=source_id
where  timestampdiff(second,
timestampdiff(second, CONVERT_TZ(src.opened_at,'GMT','America/Los_Angeles'), CONVERT_TZ(src.approval_set,'GMT','America/Los_Angeles')),open_to_approval_duration_c)
 not in (3600) and open_to_approval_duration_c<>
 timestampdiff(second, CONVERT_TZ(src.opened_at,'GMT','America/Los_Angeles'), CONVERT_TZ(src.approval_set,'GMT','America/Los_Angeles'));
 
 
 


 
 
 
 
		
		
		