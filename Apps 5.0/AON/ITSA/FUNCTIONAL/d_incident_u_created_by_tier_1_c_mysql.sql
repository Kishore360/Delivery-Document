    SELECT CASE WHEN cnt >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.u_created_by_tier_1_c' ELSE 'SUCCESS' END as Message from 
(select count(1) cnt  
 FROM  aon_mdsdb.incident_final SRC   JOIN aon_mdwdb.d_incident TRGT  
 ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
 WHERE COALESCE( case when SRC.u_created_by_tier_1=1 then 'Y' else 'N' end)
<> (TRGT.u_created_by_tier_1_c))b;
 