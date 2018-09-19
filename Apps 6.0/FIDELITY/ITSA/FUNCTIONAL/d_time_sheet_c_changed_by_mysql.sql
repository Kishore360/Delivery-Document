SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.changed_by' ELSE 'SUCCESS' END as Message 
FROM  fidelity_mdsdb.tm_time_sheets_final SRC
JOIN  fidelity_mdwdb.d_time_sheet_c TRGT 
ON (SRC.time_sheet_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
WHERE floor(SRC.LAST_UPDATED_BY) <> TRGT.changed_by; 