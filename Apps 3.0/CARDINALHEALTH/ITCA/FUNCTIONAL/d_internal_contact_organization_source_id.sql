
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact_organization.source_id' ELSE 'SUCCESS' END as Message
FROM cardinalhealth_mdsdb.agroups_final SRC 
LEFT JOIN cardinalhealth_mdwdb.d_internal_contact_organization TRGT 
	ON  (concat(acd_no,'~',trim(item_name),'~',value) =TRGT.row_id  
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.sourceinstance,'')<> COALESCE(TRGT.source_id,'')
