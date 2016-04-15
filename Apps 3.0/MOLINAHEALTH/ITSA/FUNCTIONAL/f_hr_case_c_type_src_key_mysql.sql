SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.category_src_key' ELSE 'SUCCESS' END as Message from (
select count(1) as cnt   
FROM molinahealth_mdsdb.u_hr_case_final SRC 
LEFT JOIN molinahealth_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%TYPE~HR_CASE%' and 
  concat('TYPE~HR_CASE~~~',upper(u_type ))=  LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id 
 LEFT JOIN molinahealth_mdwdb.f_hr_case_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_type IS NULL THEN 0 else -1 end)<> (TRGT.type_src_key))a
 
 
