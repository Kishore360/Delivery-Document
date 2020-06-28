SELECT CASE WHEN cnt> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_configuration_item.tier_rating_c_key' ELSE 'SUCCESS' END as Message
 FROM (select count(1) as cnt from truist_mdsdb.cmdb_ci_final SRC 
 LEFT JOIN truist_mdwdb.d_configuration_item TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
LEFT JOIN truist_mdwdb.d_lov LKP 
 ON  (concat('TIER_RATING_C~CONFIGURATION_ITEM~',upper(SRC.u_tier_rating))= LKP.row_id 
 AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_tier_rating IS NULL THEN 0 else -1 end)<> TRGT.tier_rating_c_key
 and SRC.CDCTYPE<>'D' and TRGT.soft_deleted_flag='N')ma; 
 