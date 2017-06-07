SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset.lkp_region_c_key' ELSE 'SUCCESS' END as Message
FROM whirlpool_mdsdb.alm_asset_final SRC 
 LEFT JOIN whirlpool_mdwdb.d_asset TRGT 
 ON (SRC.sys_id=right(TRGT.row_id,32)
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN whirlpool_mdwdb.d_lov LKP 
 ON  COALESCE(CONCAT('LKP_REGION_C~ASSET','~~~',u_region_ref),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance = LKP.source_id 
where COALESCE(LKP.row_key,CASE WHEN SRC.u_region_ref IS NULL THEN 0 else '-1' end) <> TRGT.lkp_region_c_key;