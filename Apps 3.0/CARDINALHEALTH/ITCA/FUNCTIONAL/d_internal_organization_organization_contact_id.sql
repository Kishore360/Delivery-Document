
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_organization.organization_contact_id' ELSE 'SUCCESS' END as Message
FROM cardinalhealth_mdsdb.synonyms_final SRC_P
LEFT JOIN cardinalhealth_mdsdb.us_d_department_final SRC
ON () 
LEFT JOIN cardinalhealth_mdwdb.d_internal_organization TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.department_contact_id,'')<> COALESCE(TRGT.organization_contact_id,'')
