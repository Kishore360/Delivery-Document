SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.open_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM (SELECT SRC.sys_id,TRGT.row_id,TIMESTAMPDIFF(second, SRC.opened_at, SRC.closed_at), TRGT.open_to_close_duration,
TIMESTAMPDIFF(second, SRC.opened_at, SRC.closed_at)- TRGT.open_to_close_duration as difference
, dimension_wh_code = 'CLOSED'
 FROM weillcornell_mdsdb.incident_final SRC
 LEFT JOIN weillcornell_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 JOIN weillcornell_mdwdb.d_lov_map MAP ON MAP.SRC_KEY=TRGT.STATE_SRC_KEY
WHERE  TIMESTAMPDIFF(second, SRC.opened_at, SRC.closed_at)<>  TRGT.open_to_close_duration and
ABS((TIMESTAMPDIFF(second, SRC.opened_at, SRC.closed_at)- TRGT.open_to_close_duration)) <> 3600
AND dimension_wh_code = 'CLOSED'
AND SRC.sys_id not in (select B.sys_id
from
weillcornell_mdsdb.incident_final B
join weillcornell_mdsdb.sys_user_final C
on C.sys_id = B.caller_id
join weillcornell_mdsdb.cmdb_ci_final D
on D.sys_id = B.u_business_service
where UPPER(C.user_name) = 'GUEST'
and UPPER(D.name) = 'ONLINE DIRECTORY' )
)t;