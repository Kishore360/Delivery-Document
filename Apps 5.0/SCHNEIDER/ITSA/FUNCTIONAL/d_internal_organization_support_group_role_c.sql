SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_organization.support_group_role_c' ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.ctm_support_group_final SRC 
JOIN schneider_mdwdb.d_internal_organization TRGT 
ON concat('GROUP~',SRC.support_group_id) = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id   
WHERE coalesce(SRC.support_group_role,'UNSPECIFIED')  <> (TRGT.support_group_role_c) ;


