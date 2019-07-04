SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact_organization.acd' ELSE 'SUCCESS' END as Message
FROM mercury_mdsdb.agroups_final SRC 
LEFT JOIN mercury_mdwdb.d_internal_contact_organization TRGT 
 ON (concat(acd_no,'~',trim(item_name),'~',value) =TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id ) 
where COALESCE(TRGT.changed_by,'') <> 'avaya_cms'