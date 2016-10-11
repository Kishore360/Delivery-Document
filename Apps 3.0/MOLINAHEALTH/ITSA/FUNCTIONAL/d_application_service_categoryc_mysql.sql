SELECT 
-- src.application_id,right(trgt.row_id,32) as trgt_row_id,src.application_category as src_service_category, trgt.service_category_c as trgt_service_category
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_application.service_category_c' ELSE 'SUCCESS' END as Message
FROM molinahealth_mdsdb.us_application_impacted_departments_final src 
LEFT JOIN molinahealth_mdwdb.d_application trgt ON src.application_id = right(trgt.row_id,32) AND src.sourceinstance = trgt.source_id
WHERE COALESCE(src.application_category,'UNSPECIFIED') <> COALESCE(trgt.service_category_c,'UNSPECIFIED');