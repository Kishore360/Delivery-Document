SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_configuration_item_c.support_group_c_key' ELSE 'SUCCESS' END as Message 
 -- select distinct SRC.sys_id,coalesce( concat('GROUP~',upper(support_group)),'UNSPECIFIED'),LKP.row_id,COALESCE-- (LKP.row_key,CASE WHEN SRC.support_group IS NULL THEN 0 else -1 end),(TRGT.support_group_c_key)
 FROM nypres_mdsdb.cmdb_ci_final SRC 
 left JOIN nypres_mdwdb.d_internal_organization LKP 
 ON  coalesce( concat('GROUP~',upper(support_group)),'UNSPECIFIED')= LKP.row_id and SRC.sourceinstance=LKP.source_id
 JOIN nypres_mdwdb.f_configuration_item_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  )
 WHERE 
  COALESCE(LKP.row_key,CASE WHEN SRC.support_group IS NULL THEN 0 else -1 end)<>(TRGT.support_group_c_key)
and TRGT.soft_deleted_flag='N' ;
 
 