
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.created_by' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.synonyms_final WHERE CDCTYPE<>'D') SRC_P
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact TRGT 
	ON ( CONCAT('INTERNAL_CONTACT~',SRC.value) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE 'avaya_cms'<> COALESCE(TRGT.created_by,'')
AND synonyms.item_type = 'agname'
