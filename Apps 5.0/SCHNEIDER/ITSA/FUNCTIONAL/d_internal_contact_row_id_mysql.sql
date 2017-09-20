SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 
'MDS to DWH data validation failed for d_internal_contact.first_name'  ELSE 'SUCCESS' END 
FROM schneider_mdsdb.ctm_people_final SRC
JOIN schneider_mdwdb.d_internal_contact TRGT ON CONCAT('INTERNAL_CONTACT','~',SRC.person_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id 
WHERE CONCAT('INTERNAL_CONTACT','~',SRC.person_id) <> TRGT.row_id