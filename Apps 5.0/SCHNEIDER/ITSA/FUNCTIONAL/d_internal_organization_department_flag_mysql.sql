SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_organization.department_flag' 
ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.com_company_final SRC JOIN schneider_mdwdb.d_internal_organization TRGT 
ON (SRC.instanceid = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE  (TRGT.department_flag) <> 'N'
 