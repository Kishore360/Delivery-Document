SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.upon_approval_src_key' ELSE 'SUCCESS' END as Message
 FROM meritsa_mdsdb.sc_task_final SRC 
 LEFT JOIN meritsa_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id ) and SRC.cdctype<>'D'
LEFT JOIN meritsa_mdwdb.d_lov LKP 
 ON  concat('UPON_APPROVAL','~','SC_TASK','~',upper(UPON_APPROVAL))= LKP.src_rowid
AND SRC.sourceinstance = LKP.source_id
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.upon_approval IS NULL THEN 0 else '-1' end)<> (TRGT.upon_approval_src_key )