
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for type_src_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_change_request TRGT 
 ON (SRC.infrastructure_change_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
	ON COALESCE(CONCAT('TYPE','~','CHANGE_REQUEST','~',UPPER(SRC.change_timing)),'UNSPECIFIED') = LKP.row_id
    and LKP.source_id = SRC.sourceinstance
 WHERE COALESCE(LKP.row_key, case when SRC.change_timing is null then 0 else -1 end,'')<> COALESCE(TRGT.type_src_key,'')