
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.updated_on' ELSE 'SUCCESS' END as Message
  FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.agent_final WHERE CDCTYPE<>'D') SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact TRGT 
	ON (CONCAT('INTERNAL_CONTACT~',SRC.value) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE TRGT.updated_on is null
AND SRC.item_type = 'agname'
