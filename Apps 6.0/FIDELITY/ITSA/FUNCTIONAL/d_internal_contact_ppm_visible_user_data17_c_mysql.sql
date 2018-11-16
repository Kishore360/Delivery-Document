SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message
FROM  fidelity_mdsdb.knta_users_final SRC
JOIN  fidelity_mdwdb.d_internal_contact TRGT 
ON (floor(SRC.USER_ID) = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
WHERE COALESCE(SRC.VISIBLE_USER_DATA17,'UNSPECIFIED')<> TRGT.ppm_visible_user_data17_c 