SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.cause_code_c_key' ELSE 'SUCCESS' END as Message
 FROM (select count(1) as cnt from bbandt_mdsdb.incident_final SRC 
 LEFT JOIN bbandt_mdwdb.d_incident TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
LEFT JOIN bbandt_mdwdb.d_lov LKP 
 ON  (concat('PRIORITY~INCIDENT~~~',upper(SRC.priority))= LKP.row_id 
 AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 else -1 end)<> TRGT.priority_src_key
 and SRC.CDCTYPE<>'D' and TRGT.soft_deleted_flag='N')ma; 
