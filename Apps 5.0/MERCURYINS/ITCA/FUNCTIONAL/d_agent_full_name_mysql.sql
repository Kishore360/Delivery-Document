SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.full_name' ELSE 'SUCCESS' END as Message
FROM mercuryins_mdsdb.synonyms_final SRC
left JOIN mercuryins_mdwdb.d_agent TRGT 
	ON (trim(CONCAT(acd_no,'~',trim(value))) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id ) and SRC.item_type = 'agname'
WHERE   trim(SRC.item_name)<> TRGT.full_name