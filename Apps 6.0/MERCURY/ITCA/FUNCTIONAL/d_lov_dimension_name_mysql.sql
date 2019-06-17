
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_lov.dimension_name' ELSE 'SUCCESS' END as Message
FROM (select count(1) as cnt from 
mercury_mdsdb.synonyms_final SRC 
LEFT JOIN mercury_mdwdb.d_lov TRGT 
	ON (CONCAT('AUX~CCA~',acd_no,'~',trim(SRC.value)) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE concat(SRC.acd_no,'-',SRC.item_name)<>COALESCE(TRGT.dimension_name,'')
AND SRC.item_type ='aux_rsn')a