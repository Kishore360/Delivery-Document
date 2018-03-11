 SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_time_card.project_key' ELSE 'SUCCESS' END as Message 
FROM fidelity_mdsdb.tm_time_sheet_lines_final SRC 
join fidelity_mdsdb.tm_time_sheet_final SRC1
on SRC.time_sheet_line_id  = SRC1.time_sheet_line_id and SRC.sourceinstance = SRC1.sourceinstance
JOIN  fidelity_mdwdb.f_time_card TRGT 
ON (SRC.time_sheet_line_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
LEFT JOIN fidelity_mdwdb.d_project LKP 
on LKP.row_id = COALESCE(SRC.work_item_id,'UNSPECIFIED') and LKP.source_id = SRC.sourceinstance
WHERE coalesce(LKP.row_key,case when SRC.work_item_id is null then 0 else -1 end ) <> TRGT.project_key; 