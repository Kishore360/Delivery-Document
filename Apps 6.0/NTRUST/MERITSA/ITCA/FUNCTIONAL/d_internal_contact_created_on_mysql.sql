SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.changed_on' ELSE 'SUCCESS' END as Message
  FROM mercury_mdsdb.synonyms_final SRC
LEFT JOIN mercury_mdwdb.d_internal_contact TRGT 
		ON (CONCAT('INTERNAL_CONTACT~',SRC.acd_no,'~',SRC.value) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id ) 
WHERE  SRC.item_type = 'agname'
and COALESCE(TRGT.created_on,'') <> null