SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Message
 FROM (
 SELECT 
SRC.sys_id,TRGT.row_id,SRC.priority,COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 else -1 end), (TRGT.priority_key)
 FROM(select *,CONCAT('PRIORITY','~','TASK','~','~','~',UPPER(priority)) as jn1 from molinahealth_mdsdb.task_final) SRC 
 JOIN (select *, DATE_FORMAT(pivot_date, '%Y-%m-%d %H:%i:%s') as jn2 from molinahealth_mdwdb.f_task_c) TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 JOIN molinahealth_mdwdb.d_lov LKP 
 ON SRC.jn1= LKP.row_id AND SRC.sourceinstance= LKP.source_id AND
 TRGT.jn2 BETWEEN effective_from AND effective_to
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 else -1 end)<> (TRGT.priority_key)
 )a
 
