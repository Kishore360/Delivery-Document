
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact_organization.created_by' ELSE 'SUCCESS' END as Message
FROM #DWH_TABLE_SCHEMA.d_internal_contact_organization TRGT 
WHERE 'avaya_cms' <> COALESCE(TRGT.created_by,'')