
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_skill.changed_by' ELSE 'SUCCESS' END as Message
FROM
(select TRGT.row_id from
int3_6_1_mdsdb.us_d_skill_final SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_skill TRGT 
	ON ( CONCAT(SRC.acd_no,'~',SRC.skill_name) =TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id )
WHERE 'admin' <> COALESCE(TRGT.changed_by,'')
and TRGT.row_key not in (0,-1)
union 
select TRGT.row_id from
int3_6_1_mdsdb.synonyms_final SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_skill TRGT 
	ON ( CONCAT(SRC.acd_no,'~',trim(SRC.value)) =TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id )
WHERE
null <> COALESCE(TRGT.changed_by,'')
and TRGT.row_key not in (0,-1)
and SRC.item_type = 'split')SQ