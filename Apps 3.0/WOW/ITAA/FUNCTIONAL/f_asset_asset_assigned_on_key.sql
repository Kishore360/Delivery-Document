SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.asset_assigned_on_key' ELSE 'SUCCESS' END as Message
 FROM wow_mdsdb.alm_asset_final  SRC 
 LEFT JOIN wow_mdwdb.f_asset TRGT ON (SRC.sys_id = TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN wow_mdwdb.d_calendar_date LKP 
 ON ( SRC.assigned )= (LKP.row_id ) AND SRC.sourceinstance= (LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assigned IS NULL THEN NULL else '-1' end)<> COALESCE(TRGT.asset_assigned_on_key,'');