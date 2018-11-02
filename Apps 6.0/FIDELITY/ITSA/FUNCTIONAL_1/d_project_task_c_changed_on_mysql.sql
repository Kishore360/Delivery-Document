SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message
FROM  fidelity_mdsdb.knta_lookups_final SRC
JOIN  fidelity_mdwdb.d_project_task_c TRGT 
ON (COALESCE(CONCAT(SRC.LOOKUP_CODE,'~~~TMG - MISC. WORK ITEMS'),'UNSPECIFIED') = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
and SRC.LOOKUP_TYPE = 'TMG - Misc. Work Items' 
WHERE CONVERT_TZ(SRC.LAST_UPDATE_DATE,'GMT','America/New_York') <> TRGT.changed_on; 