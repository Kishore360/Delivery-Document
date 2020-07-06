SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_item_ext_c.work_item_system_qa_risk_profile_c_key' ELSE 'SUCCESS' END as Message 
FROM jhi_mdsdb.issue_final  SRC 
JOIN jhi_mdwdb.d_work_item_ext_c TRGT ON (SRC.id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
LEFT JOIN jhi_mdwdb.d_lov LKP ON (CONCAT('QA_RISK_PROFILE_C~WORK_ITEM~',SRC.System_QA_Risk_Profile) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id ) 
WHERE CASE                       
                    WHEN SRC.System_QA_Risk_Profile IS NULL                      
                    or  SRC.System_QA_Risk_Profile = '' THEN  0 else COALESCE(LKP.row_key,-1) end<> (TRGT.work_item_system_qa_risk_profile_c_key) 
