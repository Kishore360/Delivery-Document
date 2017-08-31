SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_contact.user_name'
ELSE 'SUCCESS' END as Message FROM chneider_mdsdb.CTM_PEOPLE SRC
JOIN chneider_mdwdb.d_internal_contact TRGT ON CONCAT('INTERNAL_CONTACT','~',SRC.remedy_login_id)=TRGT.row_id AND SRC.sourceinstance = TRGT.source_id 
WHERE COALESCE(SRC.Remedy_Login_ID,'UNSPECIFIED')<> TRGT.user_name