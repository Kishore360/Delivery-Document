
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_map.changed_on' ELSE 'SUCCESS' END as Message
  FROM mercuryins_mdsdb.us_d_aux_lov_map_final SRC 
LEFT JOIN mercuryins_mdwdb.d_lov_map TRGT 
	on (SRC.row_id=TRGT.row_id
	AND SRC.sourceinstance =TRGT.source_id )
WHERE SRC.changed_on<> TRGT.changed_on 
