SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset.condition_c' ELSE 'SUCCESS' END as Message
 FROM wow_mdsdb.alm_asset_final  SRC 
 LEFT JOIN wow_mdwdb.d_asset TRGT 
 ON SRC.sourceinstance=TRGT.source_id 
 AND SRC.sys_id=TRGT.row_id 
 WHERE COALESCE(SRC.u_condition,'')<> TRGT.condition_c;

