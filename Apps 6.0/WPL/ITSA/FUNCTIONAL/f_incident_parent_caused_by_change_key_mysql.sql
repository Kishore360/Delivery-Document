select CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_incident .caused_by_change_key'
 ELSE 'SUCCESS' END as Message 
 FROM wpl_mdsdb.incident_final    SRC
 JOIN wpl_mdwdb.f_incident TRGT 
 ON SRC.sys_id = TRGT.row_id  
 AND SRC.sourceinstance = TRGT.source_id  
 join wpl_mdwdb.d_change_request LKP
on SRC.caused_by=LKP.row_id
and SRC.sourceinstance = LKP.source_id
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.caused_by IS NULL THEN 0 else -1 end)<> (TRGT.caused_by_change_key) 
 and SRC.CDCTYPE='X';