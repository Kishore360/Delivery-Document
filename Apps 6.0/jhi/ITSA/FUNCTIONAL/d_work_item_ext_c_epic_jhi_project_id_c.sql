SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_item_ext_c.epic_jhi_project_id_c' ELSE 'SUCCESS' END as Message 
FROM jhi_mdsdb.issue_final SRC
JOIN jhi_mdwdb.d_work_item_ext_c TRGT ON (SRC.id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
WHERE  COALESCE(SRC.Epic_JHI_Project_ID,'UNSPECIFIED')<> (TRGT.epic_jhi_project_id_c) 
and SRC.cdctype='X'