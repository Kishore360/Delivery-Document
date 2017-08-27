SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_service.category' 
ELSE 'SUCCESS' END as Message from schneider_mdsdb.ctm_Support_Group_final SRC JOIN schneider_mdwdb.d_internal_organization TRGT 
ON (SRC.instanceid = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE SRC.Support_Group_Name <> (TRGT.organization_name) 
