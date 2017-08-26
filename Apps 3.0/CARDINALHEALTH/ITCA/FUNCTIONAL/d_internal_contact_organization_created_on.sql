
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact_organization.created_on' ELSE 'SUCCESS' END as Message
FROM cardinalhealth_mdwdb.d_internal_contact_organization TRGT 
WHERE  TRGT.created_on is null
