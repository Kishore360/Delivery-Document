

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_time_key' ELSE 'SUCCESS' END as Message
 FROM weillcornell_mdsdb.incident_final SRC
 LEFT JOIN weillcornell_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN weillcornell_mdwdb.d_calendar_time LKP 
on (LKP.row_id = date_format(convert_tz(SRC.opened_at,'GMT','America/New_York'),'%H%i')  and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,'')<>  COALESCE(TRGT.opened_time_key,'') 
 and    SRC.sys_id not in (select B.sys_id
from
weillcornell_mdsdb.incident_final B
join weillcornell_mdsdb.sys_user_final C
on C.sys_id = B.caller_id
join weillcornell_mdsdb.cmdb_ci_final D
on D.sys_id = B.u_business_service
where UPPER(C.user_name) = 'GUEST'
and UPPER(D.name) = 'ONLINE DIRECTORY' ) 
