SELECT CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_task_c.met_sla_flag' ELSE 'SUCCESS' END as Message
 FROM (select count(1) as CNT from cardinalhealth_mdsdb.task_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.d_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE   CASE WHEN SRC.made_sla=0 THEN 'N' ELSE 'Y' END <> TRGT.met_sla_flag)ma;