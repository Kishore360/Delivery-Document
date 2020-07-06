SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_item_ext_c.product_team_id_c' ELSE 'SUCCESS' END as Message 
FROM jhi_mdsdb.issue_ext_final SRC
JOIN jhi_mdwdb.d_work_item_ext_c TRGT ON (SRC.record_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
WHERE  COALESCE(SRC.customfield_11007,'UNSPECIFIED')<> (TRGT.product_team_id_c) 
and SRC.cdctype='X'
