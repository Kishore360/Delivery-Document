
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset.computer_usage_src_c_key' ELSE 'SUCCESS' END as Message
 FROM usf_mdsdb.alm_asset_final SRC 
 LEFT JOIN usf_mdwdb.d_asset TRGT 
 on (CONCAT('ASSET~',SRC.sys_id) =TRGT.row_id
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN usf_mdwdb.d_lov LKP 
 ON COALESCE( CONCAT('COMPUTER_USAGE~ALM_ASSET~~~',UPPER(SRC.u_computer_usage)),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance = LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_computer_usage IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.computer_usage_src_c_key,'');

 
