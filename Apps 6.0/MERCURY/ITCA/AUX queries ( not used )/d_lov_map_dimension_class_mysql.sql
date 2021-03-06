
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_map.dimension_class' ELSE 'SUCCESS' END as Message
FROM mercury_mdsdb.us_d_aux_lov_map_final SRC 
LEFT JOIN mercury_mdwdb.d_lov_map TRGT 
	on (SRC.row_id=TRGT.row_id
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.dimension_class,-1)<> COALESCE(TRGT.dimension_class,-1)
