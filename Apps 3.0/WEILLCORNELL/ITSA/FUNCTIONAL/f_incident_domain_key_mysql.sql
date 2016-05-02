

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.domain_key' ELSE 'SUCCESS' END as Message from(
select 
COALESCE(LKP.row_key,CASE WHEN SRC.sys_domain IS NULL THEN 0 else '-1' end)abc, COALESCE(TRGT.domain_key,'')def
 FROM weillcornell_mdsdb.incident_final SRC 
 LEFT JOIN weillcornell_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN weillcornell_mdwdb.d_domain LKP 
 ON ( SRC.sys_domain= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 where  SRC.sys_id not in (select B.sys_id
from
weillcornell_mdsdb.incident_final B
join weillcornell_mdsdb.sys_user_final C
on C.sys_id = B.caller_id
join weillcornell_mdsdb.cmdb_ci_final D
on D.sys_id = B.u_business_service
where UPPER(C.user_name) = 'GUEST'
and UPPER(D.name) = 'ONLINE DIRECTORY' ) )a
 WHERE abc<>def