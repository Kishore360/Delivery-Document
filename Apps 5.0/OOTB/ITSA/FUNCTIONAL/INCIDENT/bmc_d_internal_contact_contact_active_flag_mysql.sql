SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_contact.contact_active_flag'
ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.CTM_PEOPLE SRC
JOIN schneider_mdwdb.d_internal_contact TRGT ON concat('INTERNAL_CONTACT','~',SRC.instance_id)=TRGT.row_id AND SRC.sourceinstance = TRGT.source_id  
WHERE COALESCE(SRC.Profile_Status ,'UNSPECIFIED') <> (TRGT.contact_active_flag)