SELECT  CASE WHEN 
count(1)> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.approval_state_src_key' ELSE 'SUCCESS' END as Message
 FROM 
 (select sys_id,approval as approval,sourceinstance from
 tivo_mdsdb.u_tech_ops_request_final where sys_id not in(select sys_id from tivo_mdsdb.sc_request_final)
union 
select sys_id,approval as approval,sourceinstance from tivo_mdsdb.sc_req_item_final
union 
select sys_id,approval as approval,sourceinstance from tivo_mdsdb.sc_request_final
) s
 LEFT JOIN tivo_mdwdb.f_request TRGT 
 ON (s.sys_id =TRGT.row_id  
 AND s.sourceinstance= TRGT.source_id  )
LEFT JOIN tivo_mdwdb.d_lov LKP 
 ON (COALESCE( concat('APPROVAL','~','TASK','~','~','~',upper(s.approval)),'UNSPECIFIED')= LKP.row_id 
AND s.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN s.approval IS NULL THEN 0 else -1 end)<> 
(TRGT.approval_state_src_key);