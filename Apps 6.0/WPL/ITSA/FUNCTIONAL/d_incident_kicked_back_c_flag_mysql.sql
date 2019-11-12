SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.kicked_back_c_flag' ELSE 'SUCCESS' END as Message FROM 
wpl_mdsdb.incident_final  SRC JOIN wpl_mdwdb.d_incident TRGT
 ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  
 WHERE (CASE WHEN incf.u_kicked_back = 1 THEN 'Y' ELSE 'N' END) <> (TRGT.kicked_back_c_flag)
and SRC.cdctype='X' 
