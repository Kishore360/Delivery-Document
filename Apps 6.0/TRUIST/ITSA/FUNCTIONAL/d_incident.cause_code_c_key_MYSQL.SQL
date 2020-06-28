SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.cause_code_c_key' ELSE 'SUCCESS' END as Message
 FROM (select count(1) as cnt from truist_mdsdb.incident_final SRC 
 LEFT JOIN truist_mdwdb.d_incident TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
LEFT JOIN truist_mdwdb.d_lov LKP 
 ON  (concat('CAUSE_CODE_C~INCIDENT~',upper(SRC.u_cause_code))= LKP.row_id 
 AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_cause_code IS NULL THEN 0 else -1 end)<> TRGT.cause_code_c_key
 and SRC.CDCTYPE<>'D' and TRGT.soft_deleted_flag='N')ma; 
