

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.close_code_src_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.incident_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN <<tenant>>_mdwdb.d_lov LKP 
 ON (coalesce( concat('CLOSE_CODE','~','INCIDENT','~','~','~',upper(close_code)),'-99')= coalesce(LKP.src_rowid,'-99') 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.close_code IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.close_code_src_key,'')
