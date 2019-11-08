
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM 
 whirlpool_mdsdb.asmt_assessment_instance_final tsd 
 JOIN whirlpool_mdsdb.task_final tf 
on tf.sys_id = tsd.u_parent_ticket and tf.sourceinstance=tsd.sourceinstance
 
LEFT JOIN whirlpool_mdwdb.d_configuration_item LKP 
 ON ( COALESCE(tf.cmdb_ci,'UNSPECIFIED') = LKP.row_id 
AND tf.sourceinstance= LKP.source_id )
join whirlpool_mdwdb.f_task_survey ts on  ts.row_id=tsd.sys_id and ts.source_id=tsd.sourceinstance
 WHERE LKP.soft_deleted_flag='N' and  COALESCE(LKP.row_key,CASE WHEN tf.cmdb_ci IS NULL THEN 0 else -1 end)<> (ts.configuration_item_c_key)
 