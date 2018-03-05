SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message from (
select count(1) as cnt   
FROM aetna_mdsdb.problem_final SRC 
LEFT JOIN aetna_mdwdb.d_lov LKP 
 ON COALESCE(CONCAT('subcategory','~','problem','~','~','~',UPPER(SRC.u_sub_category)),'UNSPECIFIED')=  LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
 LEFT JOIN aetna_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_sub_category IS NULL THEN 0 else -1 end)<> (TRGT.sub_category_src_key))a