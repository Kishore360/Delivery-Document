
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_organization.fax_phone_number' ELSE 'SUCCESS' END as Message
FROM cardinalhealth_mdsdb.us_d_internal_organization_final SRC 
LEFT JOIN cardinalhealth_mdwdb.d_internal_organization TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.fax_phone_number,'')<> COALESCE(TRGT.fax_phone_number,'')
