
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_map.wh_dimension_class' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.us_d_aux_lov_map_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map TRGT 
	on (SRC.row_id=TRGT.row_id
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.wh_dimension_class,'')<> COALESCE(TRGT.wh_dimension_class,'')
