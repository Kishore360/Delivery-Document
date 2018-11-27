SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
FROM png_mdsdb.incident_final SRC
LEFT JOIN png_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%WHY_NOT_CWT_C~INCIDENT%' and 
( concat('WHY_NOT_CWT_C~INCIDENT~~~',upper(u_choice_2))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ) 
  JOIN png_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_choice_2 IS NULL THEN 0 else -1 end)<> (TRGT.why_now_cwt_src_c_key);
 
 
 