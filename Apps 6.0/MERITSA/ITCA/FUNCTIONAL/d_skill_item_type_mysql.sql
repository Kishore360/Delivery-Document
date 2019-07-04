
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_skill.acd_id' ELSE 'SUCCESS' END as Message
FROM 
(select TRGT.row_id from
meritsa_mdsdb.us_d_skill_final SRC 
LEFT JOIN meritsa_mdwdb.d_skill TRGT 
		ON ( CONCAT(SRC.acd_no,'~',SRC.skill_name) =TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id )
WHERE null <> COALESCE(TRGT.description,'')
and TRGT.row_key not in (0,-1)
union 
select TRGT.row_id from
meritsa_mdsdb.synonyms_final SRC 
LEFT JOIN meritsa_mdwdb.d_skill TRGT 
	ON ( CONCAT(SRC.acd_no,'~',trim(SRC.value)) =TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id )
WHERE trim(SRC.descr) <> COALESCE(TRGT.description,'')
and TRGT.row_key not in (0,-1) and TRGT.current_flag='Y'
and SRC.item_type = 'split')SQ

