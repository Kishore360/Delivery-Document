 SELECT CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.u_major_c
' ELSE 'SUCCESS' END as Message  
 FROM (select count(1)cnt from aon_mdsdb.incident_final SRC
 LEFT JOIN aon_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE CASE WHEN SRC.u_major=1 THEN 'Y' ELSE 'N' END 
<> TRGT.u_major_c)b;