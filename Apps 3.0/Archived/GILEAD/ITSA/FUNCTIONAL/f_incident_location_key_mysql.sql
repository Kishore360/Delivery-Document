
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.location_key' ELSE 'SUCCESS' END as Message
from
(
 select count(1) as cnt
 FROM gilead_mdsdb.incident_final SRC 
 LEFT JOIN gilead_mdsdb.sys_user_final su  ON su.sys_id =SRC.caller_id
 LEFT JOIN gilead_mdwdb.f_incident TRGT  ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
 LEFT JOIN gilead_mdwdb.d_location LKP  ON su.location= LKP.row_id
 WHERE COALESCE(LKP.row_key,CASE WHEN su.location IS NULL THEN 0 else -1 end)<>(TRGT.location_key))a  
