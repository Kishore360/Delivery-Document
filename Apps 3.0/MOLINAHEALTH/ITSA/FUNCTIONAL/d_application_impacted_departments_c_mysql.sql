SELECT 
-- src.application_id,right(trgt.row_id,32) as trgt_row_id,src.impacted_departments as src_impacted_departments, trgt.impacted_departments_c as trgt_impacted_departments
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_application.impacted_departments_c' ELSE 'SUCCESS' END as Message
FROM molinahealth_mdsdb.us_application_impacted_departments_final src 
LEFT JOIN molinahealth_mdwdb.d_application trgt ON src.application_id = right(trgt.row_id,32) AND src.sourceinstance = trgt.source_id
WHERE coalesce(src.impacted_departments,'UNSPECIFIED') <> coalesce(trgt.impacted_departments_c,'UNSPECIFIED');