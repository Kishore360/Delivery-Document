SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.mdm_id' ELSE 'SUCCESS' END as Message
FROM mercuryins_mdsdb.synonyms_final SRC
left JOIN mercuryins_mdwdb.d_internal_contact TRGT 
	ON (CONCAT('INTERNAL_CONTACT~',acd_no,'~',trim(value)) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id ) 
WHERE  SRC.item_type = 'agname' and
SRC.value<> TRGT.mdm_id
