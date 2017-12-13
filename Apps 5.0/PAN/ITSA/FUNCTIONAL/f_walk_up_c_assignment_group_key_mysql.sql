SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_walk_up_c.assignment_group_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM pan_mdsdb.u_walk_up_final SRC
 LEFT JOIN pan_mdwdb.f_walk_up_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id and TRGT.soft_deleted_flag='N'  )
 LEFT JOIN pan_mdwdb.d_internal_organization LKP 
 ON ( COALESCE(CONCAT('GROUP','~',SRC.ASSIGNMENT_GROUP),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assignment_group IS NULL THEN 0 else -1 end)<> TRGT.assignment_group_key)temp
 
 