SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.assigned_to_key' ELSE 'SUCCESS' END as Message
 FROM (select sys_id,assigned_to,sourceinstance from
 tivo_mdsdb.u_tech_ops_request_final where sys_id not in(select sys_id from tivo_mdsdb.sc_request_final)
union 
select sys_id,assigned_to,sourceinstance from tivo_mdsdb.sc_req_item_final
) s 
 LEFT JOIN tivo_mdwdb.f_request TRGT 
 ON (s.sys_id =TRGT.row_id  
 AND s.sourceinstance= TRGT.source_id  )
 LEFT JOIN tivo_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',s.assigned_to)= LKP.row_id 
AND s.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN s.assigned_to IS NULL THEN 0 else -1 end)<>
 (TRGT.assigned_to_key)