SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset.support_group_c_key' ELSE 'SUCCESS' END as Message
FROM whirlpool_mdsdb.alm_asset_final SRC 
 LEFT JOIN whirlpool_mdwdb.d_asset TRGT 
 ON (SRC.sys_id=right(TRGT.row_id,32)
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN whirlpool_mdwdb.d_internal_organization LKP 
 ON  COALESCE(CONCAT('GROUP~',SRC.support_group),'UNSPECIFIED') = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id 
where COALESCE(LKP.row_key,CASE WHEN SRC.support_group IS NULL THEN 0 else '-1' end) <> TRGT.support_group_c_key;