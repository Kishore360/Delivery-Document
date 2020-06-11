
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.business_hours_per_day' ELSE 'SUCCESS' END as Message
FROM appsccarei_mdsdb.synonyms_final SRC_P
LEFT JOIN appsccarei_mdsdb.us_d_internal_contact_final SRC
ON () 
LEFT JOIN appsccarei_mdwdb.d_internal_contact TRGT 
	ON (CONCAT('INTERNAL_CONTACT~',SRC.value) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.,'')<> COALESCE(TRGT.business_hours_per_day,'')
AND synonyms.item_type = 'agname'
