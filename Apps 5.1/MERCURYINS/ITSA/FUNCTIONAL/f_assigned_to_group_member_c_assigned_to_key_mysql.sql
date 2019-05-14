

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_assigned_to_group_member_c.assigned_to_key' ELSE 'SUCCESS' END as Message
 FROM mercuryins_mdsdb.sys_user_grmember_final SRC 
 LEFT JOIN mercuryins_mdwdb.f_assigned_to_group_member_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN mercuryins_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',user)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.user
 IS NULL THEN 0 else -1 end)<> (TRGT.assigned_to_key)


