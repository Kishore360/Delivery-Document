SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_item_ext_c.is_scrum_master_dedicated_c' ELSE 'SUCCESS' END as Message 
FROM jhi_mdsdb.issue_final SRC
JOIN jhi_mdwdb.d_work_item_ext_c TRGT ON (SRC.id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
WHERE  COALESCE(SRC.Scrum_Master_Dedicated,'UNSPECIFIED')<> (TRGT.is_scrum_master_dedicated_c) 
and SRC.cdctype='X'