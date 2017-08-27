SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_contact.pivot_date'
ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.CTM_PEOPLE SRC
JOIN schneider_mdwdb.d_internal_contact TRGT ON CONCAT('INTERNAL_CONTACT','~',SRC.remedy_login_id)=TRGT.row_id AND SRC.sourceinstance = TRGT.source_id 
WHERE OALESCE(convert_tz(SRC.last_modified_date,'GMT','America/Los_Angeles') ,'UNSPECIFIED')<> TRGT.pivot_date