SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_organization.legal_entity_flag OR ' 
ELSE 'SUCCESS' END as Message from schneider_mdsdb.com_company_final SRC JOIN schneider_mdwdb.d_internal_organization TRGT 
ON (SRC.instanceid = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE  (TRGT.legal_entity_flag) <> 'N'
 