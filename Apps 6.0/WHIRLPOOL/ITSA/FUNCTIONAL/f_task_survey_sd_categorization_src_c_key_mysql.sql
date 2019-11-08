
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdwdb.f_task_survey ts
JOIN whirlpool_mdsdb.asmt_assessment_instance_final tsd ON ts.row_id=tsd.sys_id and ts.source_id=tsd.sourceinstance
LEFT JOIN whirlpool_mdsdb.task_final tf 
on tf.sys_id = tsd.u_parent_ticket
 
 
LEFT JOIN whirlpool_mdwdb.d_lov LKP 
 ON ( COALESCE( CONCAT('U_SD_CATEGORIZATION~SURVEY~~~',upper(tsd.u_sd_categorization)),'UNSPECIFIED') = LKP.row_id 
AND tsd.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN tsd.u_sd_categorization IS NULL THEN 0 else -1 end)<> (ts.sd_categorization_src_c_key)
 and tf.cdctype='X'