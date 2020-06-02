SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset.expenditure_type_key' ELSE 'SUCCESS' END as Message
  FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.alm_asset_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_asset TRGT 
 ON (concat('ASSET~',SRC.sys_id)=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
  LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON (concat('ASSET~EXPENDITURE_TYPE~',upper(SRC.expenditure_type))=LKP.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( LKP.row_key ,case when SRC.expenditure_type is null then 0 else -1 end)<> COALESCE(TRGT.expenditure_type_key ,'')
 