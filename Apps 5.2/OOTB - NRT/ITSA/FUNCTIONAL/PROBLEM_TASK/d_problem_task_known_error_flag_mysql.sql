

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_problem_task.known_error_flag' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT 
FROM (select * from <<tenant>>_mdsdb.problem_task_final where  cdctype<>'D') SRC 
LEFT JOIN <<tenant>>_mdsdb.problem_final PRB 
ON (SRC.problem =PRB.sys_id  
AND SRC.sourceinstance= PRB.sourceinstance  )
LEFT JOIN <<tenant>>_mdwdb.d_problem_task TRGT 
ON (SRC.sys_id =TRGT.row_id  
AND SRC.sourceinstance= TRGT.source_id  )
left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (src.cdctime<=f1.lastupdated) and COALESCE( 
 -- CASE WHEN PRB.known_error= 1 then 'Y' else 
 'N' 
 -- END 
,'')<> COALESCE(TRGT.known_error_flag ,'')) temp;

