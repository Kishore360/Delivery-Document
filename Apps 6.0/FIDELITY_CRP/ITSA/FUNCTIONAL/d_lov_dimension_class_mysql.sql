SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov.dimension_class' ELSE 'SUCCESS' END as Message
FROM 
( SELECT * FROM fidelity_mdsdb.synonyms_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN fidelity_mdwdb.d_lov TRGT 
	ON (CONCAT('AUX~CCA~',SRC.VALUE) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE 'AUX~CCA'<> COALESCE(TRGT.dimension_class,'')
AND SRC.item_type = 'aux_rsn'
