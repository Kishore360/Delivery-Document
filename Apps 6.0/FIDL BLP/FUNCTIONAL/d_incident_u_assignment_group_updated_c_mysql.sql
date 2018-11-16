SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.u_assignment_group_updated_c' ELSE 'SUCCESS' END as Message FROM fidelity_mdsdb.incident_final  SRC JOIN fidelity_mdwdb.d_incident TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) WHERE convert_tz(SRC.u_assignment_group_updated,'GMT','America/New_York')<> (TRGT.u_assignment_group_updated_c) 
