SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_item_ext_c.system_jira_project_c_key' ELSE 'SUCCESS' END as Message 
FROM jhi_mdsdb.issue_final  SRC 
JOIN jhi_mdwdb.d_work_item_ext_c TRGT ON (SRC.id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
LEFT JOIN jhi_mdwdb.d_project LKP ON (SRC.System_Jira_Project = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) 
WHERE CASE                       
                    WHEN SRC.System_Jira_Project IS NULL                      
                    or  SRC.System_Jira_Project = '' THEN  0 else COALESCE(LKP.row_key,-1) end<> (TRGT.system_jira_project_c_key) 
                    and SRC.cdctype='X'
