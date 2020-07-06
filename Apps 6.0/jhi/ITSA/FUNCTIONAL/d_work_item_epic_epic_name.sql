SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_item_epic.epic_name' ELSE 'SUCCESS' END as Message 
FROM jhi_mdsdb.issue_final SRC
JOIN jhi_mdsdb.issue_ext_final issue_ext 
ON SRC.id=issue_ext.record_id and SRC.sourceinstance=issue_ext.sourceinstance      
JOIN jhi_mdwdb.d_work_item_epic TRGT ON (SRC.key = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
WHERE  COALESCE(issue_ext.customfield_10003,'UNSPECIFIED')<> (TRGT.epic_name) 
and SRC.cdctype='X'
