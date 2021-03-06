 SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_walk_up_c.walkup_type_src_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM paloalto_mdsdb.u_walk_up_final SRC
 LEFT JOIN paloalto_mdwdb.d_walk_up_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id and TRGT.soft_deleted_flag='N'  )
 LEFT JOIN paloalto_mdwdb.d_lov LKP 
 ON ( COALESCE( CONCAT('U_WALKUP_TYPE','~','U_WALK_UP','~',UPPER(SRC.u_walkup_type)),'UNSPECIFIED') = LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_walkup_type  IS NULL THEN 0 else -1 end)<> TRGT.walkup_type_src_key)temp
 
 
 