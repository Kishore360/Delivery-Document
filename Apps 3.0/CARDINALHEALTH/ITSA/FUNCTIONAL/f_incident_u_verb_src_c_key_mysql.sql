SELECT CASE WHEN cnt >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message from 
 (select count(1) cnt FROM cardinalhealth_mdsdb.incident_final SRC 
  JOIN cardinalhealth_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN cardinalhealth_mdwdb.d_lov LKP 
 ON substring(LKP.row_id,19,length(LKP.row_id)) = SRC.u_verb
 WHERE  LKP.soft_deleted_flag='N' and TRGT.soft_deleted_flag='N'
 and LKP.dimension_class = 'U_VERB~INCIDENT' and COALESCE(LKP.row_key,CASE WHEN SRC.u_verb IS NULL THEN 0 else -1 end)<> (TRGT.u_verb_src_c_key))a