
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact_organization.row_id' ELSE 'SUCCESS' END as Message
FROM mercuryins_mdsdb.agroups_final SRC 
LEFT JOIN mercuryins_mdwdb.d_internal_contact_organization TRGT 
	ON  (concat(acd_no,'~',trim(item_name),'~',value) =TRGT.row_id  
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(concat(acd_no,'~',trim(item_name),'~',value) ,'')<> COALESCE(TRGT.row_id ,'')
