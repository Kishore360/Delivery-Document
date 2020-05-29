
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.gender_code' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.synonyms_final WHERE CDCTYPE<>'D') SRC_P
LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.us_d_internal_contact_final WHERE CDCTYPE<>'D') SRC
ON () 
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.gender_code,'')<> COALESCE(TRGT.gender_code,'')
