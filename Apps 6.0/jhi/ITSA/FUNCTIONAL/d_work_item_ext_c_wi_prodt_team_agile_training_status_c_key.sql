SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_item_ext_c.wi_prodt_team_agile_training_status_c_key' ELSE 'SUCCESS' END as Message 
FROM jhi_mdsdb.issue_final  SRC 
JOIN jhi_mdwdb.d_work_item_ext_c TRGT ON (SRC.id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
LEFT JOIN jhi_mdwdb.d_lov LKP ON (CONCAT('AGILE_TRAINING_STATUS_C~WORK_ITEM~',SRC.Product_Team_Agile_Training_Status) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id ) 
WHERE CASE                       
                    WHEN SRC.Product_Team_Agile_Training_Status IS NULL                      
                    or  SRC.Product_Team_Agile_Training_Status = '' THEN  0 else COALESCE(LKP.row_key,-1) end<> (TRGT.wi_prodt_team_agile_training_status_c_key) 
                    and SRC.cdctype='X'
