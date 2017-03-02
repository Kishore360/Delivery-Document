SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM cardinalhealth_mdsdb.problem_final SRC 
  JOIN cardinalhealth_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN cardinalhealth_mdwdb.d_lov LKP 
 ON  COALESCE( CONCAT('ROOT_CAUSE_BUSINESS_SEGMENT_C','~','PROBLEM','~','~','~',UPPER(SRC.u_root_cause_business_segment)),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_root_cause_business_segment IS NULL THEN 0 else -1 end)
 <> (TRGT.root_cause_business_segment_c_key))temp;
 