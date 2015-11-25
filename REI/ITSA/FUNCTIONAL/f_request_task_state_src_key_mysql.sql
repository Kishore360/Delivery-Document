SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(1) as cnt
FROM rei_mdsdb.sc_task_final SRC 

 LEFT JOIN rei_mdwdb.f_request_task TRGT 
 ON 
SRC.sys_id =TRGT.row_id  
 AND 
SRC.sourceinstance= TRGT.source_id 
 
LEFT JOIN rei_mdwdb.d_lov LKP 

 ON concat('STATE','~','TASK','~','~','~',upper(state))= LKP.src_rowid 

AND SRC.sourceinstance= LKP.source_id 

 WHERE COALESCE(CASE WHEN SRC.state IS NULL THEN 0 ELSE LKP.row_key end,-1) <> TRGT.state_src_key) a;