
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_skill.acd_id' ELSE 'SUCCESS' END as Message
FROM 
(select TRGT.row_id from
( SELECT * FROM #MDS_TABLE_SCHEMA.us_d_skill_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_skill TRGT 
		ON ( CONCAT(SRC.acd_no,'~',SRC.skill_name) =TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.acd_no,'') <> COALESCE(TRGT.acd_id,'')
and TRGT.row_key not in (0,-1)
union 
select TRGT.row_id from
( SELECT * FROM #MDS_TABLE_SCHEMA.synonyms_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_skill TRGT 
	ON ( CONCAT(SRC.acd_no,'~',trim(SRC.value)) =TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id )
WHERE trim(SRC.acd_no) <> COALESCE(TRGT.acd_id,'')
and TRGT.row_key not in (0,-1)
and SRC.item_type = 'split')SQ

