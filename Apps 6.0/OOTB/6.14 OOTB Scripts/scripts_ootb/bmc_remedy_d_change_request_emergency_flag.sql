
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_change_request TRGT 
 ON (SRC.infrastructure_change_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LKP
 on concat('CHANGE_TYPE','~','CHANGE_REQUEST','~',upper(SRC.change_timing)) = LKP.src_rowid 
 WHERE  coalesce(case when LKP.dimension_wh_code='EMERGENECY' then 'Y'  ELSE 'N' END)<> coalesce(TRGT.emergency_flag,'')


