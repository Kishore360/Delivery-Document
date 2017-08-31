
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_map.dimension type' ELSE 'SUCCESS' END as Message
FROM 
cardinalhealth_mdsdb.us_d_aux_lov_map_final SRC 
LEFT JOIN cardinalhealth_mdwdb.d_lov_map TRGT 
	ON (SRC.row_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE TRGT.dimension_type is not null
