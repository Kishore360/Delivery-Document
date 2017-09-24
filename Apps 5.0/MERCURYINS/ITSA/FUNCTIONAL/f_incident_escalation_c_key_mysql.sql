SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercuryins_mdsdb.incident_final SRC 
JOIN mercuryins_mdwdb.f_incident TRGT 
ON SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
join mercuryins_mdwdb.d_lov LKP
on COALESCE(CONCAT('ESCALATION','~','INCIDENT','~','~','~',UPPER(SRC.escalation)),'UNSPECIFIED')=LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC.escalation is null then  0 else -1 end )<>TRGT.escalation_c_key