
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.managed_by_c_key' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.alm_asset_final SRC 
 LEFT JOIN whirlpool_mdwdb.d_asset TRGT 
 ON (SRC.sys_id=right(TRGT.row_id,32)
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN whirlpool_mdwdb.d_internal_contact LKP 
 ON  COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.managed_by),'UNSPECIFIED') = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id 
where COALESCE(LKP.row_key,CASE WHEN SRC.managed_by IS NULL THEN 0 else '-1' end) <> TRGT.managed_by_c_key;
