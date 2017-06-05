SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.changed_on' ELSE 'SUCCESS' END as Message from 
(select TRGT.row_id,SRC.sys_id,convert_tz(SRC.sys_updated_on,'GMT','America/New_York'), TRGT.changed_on 
FROM weillcornell_mdsdb.incident_final SRC  
 JOIN weillcornell_mdwdb.f_incident TRGT  ON SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id 
WHERE convert_tz(SRC.sys_updated_on,'GMT','America/New_York')<> TRGT.changed_on 
AND SRC.sys_id not in (select B.sys_id
from
weillcornell_mdsdb.incident_final B
join weillcornell_mdsdb.sys_user_final C
on C.sys_id = B.caller_id
join weillcornell_mdsdb.cmdb_ci_final D
on D.sys_id = B.u_business_service
where UPPER(C.user_name) = 'GUEST'
and UPPER(D.name) = 'ONLINE DIRECTORY' )
)b
