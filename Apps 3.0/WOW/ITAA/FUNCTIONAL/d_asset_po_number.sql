
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset.po_number' ELSE 'SUCCESS' END as Message
 FROM wow_mdsdb.alm_asset_final  SRC 
 LEFT JOIN wow_mdwdb.d_asset TRGT 
 ON (concat('ASSET~',SRC.sys_id)=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( SRC.po_number ,'')<> COALESCE(TRGT.po_number ,'')
