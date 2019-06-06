SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercury_mdsdb.sys_user_final SRC
JOIN mercury_mdwdb.d_internal_contact TRGT  
ON (concat('INTERNAL_CONTACT~',SRC.sys_id ) = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )
WHERE case when SRC.u_agent = 1 then 'Y' else 'N' end <>TRGT.agent_c_flag
AND SRC.CDCTYPE='X';


