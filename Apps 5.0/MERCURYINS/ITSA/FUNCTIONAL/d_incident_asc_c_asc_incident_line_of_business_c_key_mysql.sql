SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercuryins_mdsdb.u_asc_ticket_final  SRC 
JOIN mercuryins_mdwdb.d_incident_asc_c TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
join mercuryins_mdwdb.d_lov LKP
on COALESCE( CONCAT('LINE_OF_BUSINESS','~','ASC_INCIDENT','~','~','~',UPPER(SRC.u_line_of_business)),'UNSPECIFIED')=LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC.u_line_of_business is  null then 0 else -1 end )<>(TRGT.asc_incident_line_of_business_c_key) 
