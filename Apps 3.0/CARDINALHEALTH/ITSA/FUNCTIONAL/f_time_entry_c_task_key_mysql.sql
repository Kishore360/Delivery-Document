SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.time_card_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.d_task LKP
 on LKP.row_id = (SRC.task) and LKP.source_id  = SRC.sourceinstance
 LEFT JOIN   cardinalhealth_mdwdb.f_time_entry_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE LKP.soft_deleted_flag='N' and TRGT.soft_deleted_flag='N' and  LKP.row_key <> TRGT.task_c_key ;