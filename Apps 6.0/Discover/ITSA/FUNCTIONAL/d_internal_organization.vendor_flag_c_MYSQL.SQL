SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_organization.vendor_flag_c' ELSE 'SUCCESS' END as Message 
FROM discover_mdsdb.core_company_final  SRC 
JOIN discover_mdwdb.d_internal_organization TRGT 
ON (CONCAT('SUBSIDIARY~',SRC.sys_id) = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  
WHERE (CASE WHEN SRC.vendor = 1 then 'Y' else 'N' END) <> (TRGT.vendor_flag_c) 
