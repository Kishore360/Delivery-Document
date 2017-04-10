
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdwdb.f_task_survey ts
JOIN whirlpool_mdsdb.asmt_assessment_instance_final tsd ON ts.row_id=tsd.sys_id and ts.source_id=tsd.sourceinstance
LEFT JOIN whirlpool_mdsdb.task_final tf 
on tf.sys_id = tsd.u_parent_ticket
 
LEFT JOIN whirlpool_mdwdb.d_configuration_item LKP 
 ON ( COALESCE(tf.cmdb_ci,'UNSPECIFIED') = LKP.row_id 
AND tf.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN tf.cmdb_ci IS NULL THEN 0 else -1 end)<> (ts.configuration_item_c_key)
 