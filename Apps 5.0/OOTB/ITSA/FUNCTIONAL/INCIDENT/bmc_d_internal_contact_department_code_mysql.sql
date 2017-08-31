SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  
THEN 'MDS to DWH data validation failed for d_internal_contact.department_code' else 'SUCCESS' end as message
FROM STM_BMC_mdsdb.CTM_PEOPLE SRC
JOIN STM_BMC_mdwdb.d_internal_contact TRGT ON CONCAT('INTERNAL_CONTACT','~',SRC.remedy_login_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id  
WHERE  COALESCE(CONCAT('DEPARTMENT~',SRC.department),'UNSPECIFIED') <> TRGT.department_code