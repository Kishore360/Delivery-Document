SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_contact.user_name' ELSE 'SUCCESS' END as Message 
FROM schneider_mdsdb.v_r_user_final SRC JOIN schneider_mdwdb.d_internal_contact TRGT 
ON SRC.resourceid   = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id  
WHERE COALESCE(SRC.employeeid0,'UNSPECIFIED') > (TRGT.user_name) 
