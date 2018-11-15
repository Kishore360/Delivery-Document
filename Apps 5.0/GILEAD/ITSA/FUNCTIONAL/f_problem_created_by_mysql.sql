SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_problem.created_by' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM (select * from gilead_mdsdb.problem_final) SRC 
 LEFT JOIN gilead_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 left join (select source_id,max(lastupdated) as lastupdated from 
 gilead_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
 where (SRC.cdctime<=f1.lastupdated) and COALESCE( SRC.sys_created_by,'')<> COALESCE(TRGT.created_by ,''))temp;
 
