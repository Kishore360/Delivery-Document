SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.u_manual_escalation_c' ELSE 'SUCCESS' END as Message
FROM fidelity_mdsdb.incident_final  SRC JOIN fidelity_mdwdb.d_incident TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
WHERE SRC.cdctype <> 'D' and
case when SRC.u_manual_escalation =0 then 'N'  else 'Y' end  <> (TRGT.u_manual_escalation_c) ;