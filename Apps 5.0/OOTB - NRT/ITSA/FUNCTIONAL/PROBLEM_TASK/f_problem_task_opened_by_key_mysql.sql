SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_problem_task.opened_by_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM (select * from <<tenant>>_mdsdb.problem_task_final where  cdctype<>'D') SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN <<tenant>>_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',opened_by)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
 where (src.cdctime<=f1.lastupdated) and COALESCE(LKP.row_key,CASE WHEN SRC.opened_by IS NULL THEN 0 else -1 end)<> (TRGT.opened_by_key))temp;
 
