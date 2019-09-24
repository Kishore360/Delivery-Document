

SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_incident.client_duration_c' ELSE 'SUCCESS' END as Message 
FROM(

select count(1)cnt from 
(select SRC.sys_id , TRGT.row_id,SRC.u_client_duration,client_duration_c ,SRC.cdctype,
COALESCE(LEFT(SRC.u_client_duration,LOCATE(' ',SRC.u_client_duration) - 1)*86400,0) + TIME_TO_SEC(RIGHT(SRC.u_client_duration,8)) as a
FROM rogers_mdsdb.incident_final SRC 
JOIN rogers_mdwdb.f_incident TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) )a
WHERE a.a <> (client_duration_c) 
and a.CDCTYPE='X' )a;