SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_contact.department_key' ELSE 'SUCCESS' END
FROM schneider_mdsdb.ctm_people_final SRC
JOIN schneider_mdwdb.d_internal_contact TRGT ON CONCAT('INTERNAL_CONTACT','~',SRC.person_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id 
JOIN schneider_mdwdb.d_internal_organization lkp ON COALESCE(CONCAT('DEPARTMENT~',SRC.department),'UNSPECIFIED')  = lkp.row_id 
WHERE COALESCE(lkp.row_key,CASE WHEN SRC.department IS NULL THEN 0 ELSE -1 END) <>  TRGT.department_key