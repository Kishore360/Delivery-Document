
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_skill.acd_id' ELSE 'SUCCESS' END as Message
FROM 
(select TRGT.row_id from
mercuryins_mdsdb.synonyms_final SRC 
LEFT JOIN mercuryins_mdwdb.d_skill TRGT 
	ON ( CONCAT(SRC.acd_no,'~',trim(SRC.value)) =TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id ) and SRC.item_type = 'split'
WHERE trim(SRC.item_name) <> TRGT.name
)SQ

