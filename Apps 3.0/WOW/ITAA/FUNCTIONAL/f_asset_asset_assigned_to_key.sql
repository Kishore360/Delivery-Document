SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.asset_assigned_to_key' ELSE 'SUCCESS' END as Message
 FROM wow_mdsdb.alm_asset_final  SRC 
 JOIN wow_mdwdb.f_asset TRGT 
 ON SRC.sys_id = TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id 
 JOIN wow_mdwdb.d_internal_contact LKP 
 ON  CONCAT('INTERNAL_CONTACT~' ,SRC.assigned_to) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assigned_to IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.asset_assigned_to_key,'');