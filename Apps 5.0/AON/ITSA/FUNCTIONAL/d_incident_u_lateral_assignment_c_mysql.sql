    SELECT CASE WHEN cnt >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.u_lateral_assignment_c ' ELSE 'SUCCESS' END as Message from 
(select count(1) cnt  
 FROM  aon_mdsdb.incident_final SRC   JOIN aon_mdwdb.d_incident TRGT  
 ON (SRC.sys_id=TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
 WHERE COALESCE(CASE WHEN SRC.u_lateral_assignment=1 THEN 'Y' ELSE 'N' END)<> (TRGT.u_lateral_assignment_c ))b;
 
 