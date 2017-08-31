SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_contact.company_name'
ELSE 'SUCCESS' END as Message FROM chneider_mdsdb.ctm_people SRC
JOIN chneider_mdwdb.d_internal_contact TRGT ON CONCAT('INTERNAL_CONTACT','~',SRC.remedy_login_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id  
WHERE COALESCE(SRC.Company,'UNSPECIFIED') <> (TRGT.company_name)
