
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact_organization.changed_on' ELSE 'SUCCESS' END as Message
FROM #DWH_TABLE_SCHEMA.d_internal_contact_organization TRGT 
WHERE TRGT.changed_on is null
