SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 
'MDS to DWH data validation failed for d_internal_contact.first_name'  ELSE 'SUCCESS' END 
FROM schneider_mdsdb.ctm_people_final_final SRC
JOIN schneider_mdwdb.d_internal_contact TRGT ON CONCAT('INTERNAL_CONTACT','~',SRC.remedy_login_id)=TRGT.row_id AND SRC.sourceinstance = TRGT.source_id 
WHERE COALESCE(SRC.first_name,'UNSPECIFIED')<> TRGT.first_name