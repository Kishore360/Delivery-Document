SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercury_mdsdb.u_asc_ticket_final  SRC 
JOIN mercury_mdwdb.d_incident_asc_c TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
join mercury_mdwdb.d_lov LKP
on COALESCE( CONCAT('STATE','~','ASC_INCIDENT','~',UPPER(SRC.state)),'UNSPECIFIED')=LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC.state is  null then 0 else -1 end )<>(TRGT.asc_incident_state_c_key) 
 and SRC.CDCTYPE='X';
