SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_item_ext_c.work_item_project_type_c_key' ELSE 'SUCCESS' END as Message 
FROM jhi_mdsdb.issue_final  SRC 
JOIN jhi_mdwdb.d_work_item_ext_c TRGT ON (SRC.id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
LEFT JOIN jhi_mdwdb.d_lov LKP ON (CONCAT('PROJECT_TYPE_C~WORK_ITEM~',SRC.Epic_Project_Type) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id ) 
WHERE CASE                       
                    WHEN SRC.Epic_Project_Type IS NULL                      
                    or  SRC.Epic_Project_Type = '' THEN  0 else COALESCE(LKP.row_key,-1) end<> (TRGT.work_item_project_type_c_key) 
