SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_skill.created_by' ELSE 'SUCCESS' END as Message
FROM
(select TRGT.row_id from
cardinalhealth_mdsdb.us_d_skill_final SRC 
LEFT JOIN cardinalhealth_mdwdb.d_skill TRGT 
	ON ( CONCAT(SRC.acd_no,'~',SRC.skill_name) =TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id )
WHERE 'admin' <> COALESCE(TRGT.created_by,'')
and TRGT.row_key not in (0,-1)
union 
select TRGT.row_id from
cardinalhealth_mdsdb.synonyms_final SRC 
LEFT JOIN cardinalhealth_mdwdb.d_skill TRGT 
	ON ( CONCAT(SRC.acd_no,'~',trim(SRC.value)) =TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id )
WHERE
'admin' <> COALESCE(TRGT.created_by,'')
and TRGT.row_key not in (0,-1)
and SRC.item_type = 'split')SQ