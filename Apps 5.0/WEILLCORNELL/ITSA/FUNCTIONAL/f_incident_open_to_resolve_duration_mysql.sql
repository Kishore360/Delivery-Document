SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.open_to_resolve_duration' ELSE 'SUCCESS' END as Message FROM (
SELECT SRC.sys_id,TRGT.row_id,CASE  WHEN (SRC.opened_at IS NULL OR SRC.resolved_at is null) THEN NULL   
WHEN TIMESTAMPDIFF(SECOND,SRC.opened_at,SRC.resolved_at) < 0 THEN NULL    
ELSE TIMESTAMPDIFF(SECOND,SRC.opened_at,SRC.resolved_at) END  ,  TRGT.open_to_resolve_duration
 FROM weillcornell_mdsdb.incident_final SRC
  JOIN weillcornell_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN weillcornell_mdwdb.d_lov_map br 
 ON TRGT.state_src_key = br.src_key
WHERE  CASE  WHEN (SRC.opened_at IS NULL OR SRC.resolved_at is null) THEN NULL   
WHEN TIMESTAMPDIFF(SECOND,SRC.opened_at,SRC.resolved_at) < 0 THEN NULL    
ELSE TIMESTAMPDIFF(SECOND,SRC.opened_at,SRC.resolved_at) END  <>  TRGT.open_to_resolve_duration
and    SRC.sys_id not in (select B.sys_id
from
weillcornell_mdsdb.incident_final B
join weillcornell_mdsdb.sys_user_final C
on C.sys_id = B.caller_id
join weillcornell_mdsdb.cmdb_ci_final D
on D.sys_id = B.u_business_service
where UPPER(C.user_name) = 'GUEST'
and UPPER(D.name) = 'ONLINE DIRECTORY' ) 
 )a