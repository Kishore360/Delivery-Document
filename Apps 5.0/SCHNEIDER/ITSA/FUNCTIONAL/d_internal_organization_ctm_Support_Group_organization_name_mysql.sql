SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_service.category' 
ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.ctm_support_group_final SRC JOIN schneider_mdwdb.d_internal_organization TRGT 
ON (SRC.support_group_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE SRC.support_group_name <> (TRGT.organization_name) 
