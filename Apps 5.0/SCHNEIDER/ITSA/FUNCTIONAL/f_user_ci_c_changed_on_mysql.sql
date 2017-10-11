SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_user_ci_c.changed_on' ELSE 'SUCCESS' END as Message 
FROM schneider_mdsdb.v_gs_installed_software_final SRC JOIN schneider_mdwdb.f_user_ci_c TRGT 
ON CONCAT(SRC.resourceid,'~',SRC.groupid)  = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id  
 WHERE SRC.timestamp <> (TRGT.changed_on) 
