
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_skill.created_by' ELSE 'SUCCESS' END as Message
FROM cardinalhealth_mdsdb.us_d_skill_final SRC 
LEFT JOIN cardinalhealth_mdwdb.d_skill TRGT 
	ON ( CONCAT(SRC.acd_no,'~',SRC.skill_name) =TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.created_by,'') <> COALESCE(TRGT.created_by,'')