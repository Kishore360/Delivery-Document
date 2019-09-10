
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.urgency_src_key' ELSE 'SUCCESS' END as Message
 FROM mcdonalds_mdsdb.change_task_final SRC 
 LEFT JOIN mcdonalds_mdwdb.d_change_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN mcdonalds_mdwdb.d_lov LKP 
 ON  concat('URGENCY','~','CHANGE_TASK','~','~','~',upper(URGENCY))= LKP.src_rowid
AND SRC.sourceinstance = LKP.source_id
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.urgency IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.urgency_src_key ,'')
 
 