SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  
THEN 'MDS to DWH data validation failed for d_internal_contact.department_key' else  'SUCCESS' end as message
FROM STM_BMC_mdsdb.ctm_people_final SRC
JOIN STM_BMC_mdwdb.d_internal_contact TRGT ON CONCAT('INTERNAL_CONTACT','~',SRC.remedy_login_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id 
JOIN STM_BMC_mdwdb.ctm_people_final_Organization lkp ON COALESCE(CONCAT('DEPARTMENT~',SRC.department),'UNSPECIFIED')  = lkp.row_id and SRC.sourceinstance = lkp.source_id 
WHERE COALESCE(lkp.row_key,CASE WHEN SRC.department IS NULL THEN 0 ELSE -1 END)<> TRGT.department_key