 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_key' ELSE 'SUCCESS' END as Message
 from pan6_mdwdb.f_request_item f
JOIN  pan6_mdsdb.sc_req_item_final src on sys_id=row_id and sourceinstance=source_id
where  closed_within_48_hours_c<>
 case when timestampdiff(hour, CONVERT_TZ(src.opened_at,'GMT','America/Los_Angeles'), CONVERT_TZ(src.closed_at,'GMT','America/Los_Angeles'))<=48 then 1 else 0 end ;
 
 
 