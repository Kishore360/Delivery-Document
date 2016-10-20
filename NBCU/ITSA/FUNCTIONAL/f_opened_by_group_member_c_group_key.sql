



 SELECT count(*) FROM nbcu_mdsdb.sys_user_grmember_final SRC
 LEFT JOIN nbcu_mdwdb.f_opened_by_group_member_c TRGT 
 ON (SRC.sys_id ) =(TRGT.row_id ) 
 AND (SRC.sourceinstance )=(TRGT.source_id ) 
 LEFT JOIN nbcu_mdwdb.d_internal_organization LKP 
 ON (CONCAT('GROUP~',UPPER(SRC.group)))= (LKP.row_id )
 AND SRC.sourceinstance= LKP.source_id
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.group IS NULL THEN 0 else -1 end)<>(TRGT.group_key) ;