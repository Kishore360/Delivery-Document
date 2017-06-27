SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_problem.closed_by_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM svb_mdsdb.problem_final SRC 
 LEFT JOIN svb_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
   left join svb_mdwdb.d_lov_map p
on TRGT.state_src_key=p.src_key and dimension_wh_code='CLOSED' AND p.dimension_class = 'STATE~PROBLEM'
LEFT JOIN svb_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',closed_by)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id
AND TRGT.pivot_date
 BETWEEN LKP.effective_from AND LKP.effective_to)
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.closed_by IS NULL THEN 0 else -1 end)<> (TRGT.closed_by_key))temp;

