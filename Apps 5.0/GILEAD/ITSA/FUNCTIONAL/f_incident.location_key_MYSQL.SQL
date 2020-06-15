SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.location_key' ELSE 'SUCCESS' END as Message
from
(
select count(1) as cnt
FROM gilead_mdsdb.incident_final SRC
LEFT JOIN gilead_mdsdb.sys_user_final su ON su.sys_id =SRC.caller_id AND su.sourceinstance=SRC.sourceinstance
LEFT JOIN gilead_mdwdb.f_incident TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
LEFT JOIN gilead_mdwdb.d_location LKP ON su.location= LKP.row_id AND su.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN (SRC.caller_id is NULL) or (su.sys_id is not null and su.location IS NULL) THEN 0 else -1 end)<>TRGT.location_key
and TRGT.soft_deleted_flag='N')a