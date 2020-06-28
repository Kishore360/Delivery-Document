SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_configuration_item.role_c_key' ELSE 'SUCCESS' END as Message
 FROM (select count(1) as cnt from truist_mdsdb.cmdb_ci_final SRC 
 LEFT JOIN truist_mdwdb.d_configuration_item TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
LEFT JOIN truist_mdwdb.d_lov LKP 
 ON  LKP.dimension_class =  'ROLE_C~CONFIGURATION_ITEM' and (concat('ROLE_C~CONFIGURATION_ITEM~',upper(SRC.u_role))= LKP.row_id AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_role IS NULL THEN 0 else -1 end)<> TRGT.role_c_key
 and SRC.CDCTYPE<>'D' and TRGT.soft_deleted_flag='N')ma; 
