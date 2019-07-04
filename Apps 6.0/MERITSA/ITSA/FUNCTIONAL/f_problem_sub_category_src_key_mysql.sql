

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.sub_category_src_key' ELSE 'SUCCESS' END as Message
 FROM meritsa_mdsdb.problem_final SRC 
 LEFT JOIN meritsa_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN meritsa_mdwdb.d_lov LKP 
 ON ( concat('SUBCATEGORY~problem~',upper(subcategory))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.subcategory IS NULL THEN 0 else -1 end)<> (TRGT.sub_category_src_key) and SRC.CDCTYPE<>'D'
