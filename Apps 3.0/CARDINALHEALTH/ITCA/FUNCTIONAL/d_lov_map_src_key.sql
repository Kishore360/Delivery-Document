
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_map.src_key' ELSE 'SUCCESS' END as Message
FROM cardinalhealth_mdsdb.us_d_aux_lov_map_final SRC 
LEFT JOIN cardinalhealth_mdwdb.d_lov_map TRGT 
	ON (SRC.row_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
    left join cardinalhealth_mdwdb.d_lov b
    on b.src_rowid = TRGT.src_rowid and b.source_id = TRGT.source_id
WHERE coalesce( CASE WHEN b.src_rowid='UNSPECIFIED' then 0 else b.row_key end ,-1) <> COALESCE(TRGT.src_key,'') 
