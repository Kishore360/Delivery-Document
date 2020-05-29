
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_skill.created_on' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.us_d_skill_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_skill TRGT 
	ON ( CONCAT(SRC.acd_no,'~',SRC.skill_name) =TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.created_on,'') <> COALESCE(TRGT.created_on,'')