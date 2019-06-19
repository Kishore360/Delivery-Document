
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov.created_on' ELSE 'SUCCESS' END as Message
FROM mercury_mdsdb.synonyms_final SRC 
LEFT JOIN mercury_mdwdb.d_lov TRGT 
<<<<<<< HEAD
	ON (CONCAT('AUX~CCA~',acd_no,'~',trim(SRC.value)) =TRGT.row_id 
=======
	ON (CONCAT('AUX~CCA~~~',acd_no,'~',trim(SRC.value)) =TRGT.row_id 
>>>>>>> 90a6eb9c9ef3b1124c6afef09cdac50b18682cb2
	AND SRC.sourceinstance =TRGT.source_id )
WHERE TRGT.created_on is null
AND SRC.item_type = 'aux_rsn'
