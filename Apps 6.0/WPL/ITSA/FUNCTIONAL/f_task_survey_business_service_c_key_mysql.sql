
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM wpl_mdwdb.f_task_survey ts
JOIN wpl_mdsdb.asmt_assessment_instance_final tsd ON ts.row_id=tsd.sys_id and ts.source_id=tsd.sourceinstance
LEFT JOIN wpl_mdsdb.task_final tf 
on tf.sys_id = tsd.u_parent_ticket
 
LEFT JOIN wpl_mdwdb.d_service LKP 
 ON ( COALESCE(CONCAT('BUSINESS_SERVICE~',tf.u_business_service),'UNSPECIFIED') = LKP.row_id 
AND tf.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN tf.u_business_service IS NULL THEN 0 else -1 end)<> (ts.business_service_c_key)
 and tf.cdctype='X'