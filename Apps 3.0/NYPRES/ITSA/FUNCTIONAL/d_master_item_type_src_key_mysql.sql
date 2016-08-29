SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_master_item.type_of_item_c_key' ELSE 'SUCCESS' END as Message
FROM nypres_mdsdb.sc_cat_item_final SRC 
 LEFT JOIN nypres_mdwdb.d_master_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN nypres_mdwdb.d_lov LKP 
 ON ( concat('U_TYPE~SC_CAT_ITEM~~~',upper(u_type))= LKP.row_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_type IS NULL THEN 0 else -1 end) <>  COALESCE(TRGT.type_src_key);
