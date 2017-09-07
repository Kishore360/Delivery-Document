
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_skill.created_by' ELSE 'SUCCESS' END as Message
FROM cardinalhealth_mdsdb.synonyms_final SRC 
LEFT JOIN cardinalhealth_mdwdb.d_skill TRGT 
	ON (concat(SRC.acd_no,'~',value) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE  trim(SRC.item_name) <> COALESCE(TRGT.name,'')
AND SRC.item_type = 'split'