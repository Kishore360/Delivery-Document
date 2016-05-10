SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.opened_on_key' ELSE 'SUCCESS' END as Message
FROM 
molinahealth_mdsdb.asmt_assessment_instance_final SRC
 LEFT JOIN molinahealth_mdwdb.f_task_survey TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
left join 
molinahealth_mdwdb.d_lov LKP
on  concat('STATE~SURVEY~~~', UPPER(SRC.state))=LKP.row_id
and SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end)<> (TRGT.state_src_key)