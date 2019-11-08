SELECT  CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.task_sla_final SRC 
 LEFT JOIN whirlpool_mdsdb.task_final task 
                ON SRC.task = task.sys_id
JOIN whirlpool_mdwdb.f_task_sla TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 
 
LEFT JOIN whirlpool_mdwdb.d_ad_hoc_request_c LKP 
 on task.sys_id = LKP.row_id and task.sourceinstance = LKP.source_id
 WHERE 
 case when upper(task.sys_class_name)  ='U_AD_HOC_REQUEST' then LKP.row_key else 0 END
 <> (TRGT.ad_hoc_request_c_key) and SRC.CDCTYPE='X'