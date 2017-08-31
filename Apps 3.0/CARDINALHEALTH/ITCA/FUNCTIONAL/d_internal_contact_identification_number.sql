SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.identification_number' ELSE 'SUCCESS' END as Message
FROM cardinalhealth_mdsdb.synonyms_final SRC_P
left JOIN cardinalhealth_mdwdb.d_internal_contact TRGT 
	ON (CONCAT('INTERNAL_CONTACT~1~',SRC_P.value) =TRGT.row_id 
	AND SRC_P.sourceinstance =TRGT.source_id ) 
WHERE  SRC_P.item_type = 'agname' and
COALESCE(SRC_P.value,'')<> COALESCE(TRGT.identification_number,'')
