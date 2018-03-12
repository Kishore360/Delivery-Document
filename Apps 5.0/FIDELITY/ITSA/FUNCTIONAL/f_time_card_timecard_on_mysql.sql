SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_time_card.timecard_on' ELSE 'SUCCESS' END as Message 
FROM fidelity_mdsdb.tm_time_sheet_lines_final SRC 
join fidelity_mdsdb.tm_time_sheets_final SRC1
on SRC.time_sheet_id  = SRC1.time_sheet_id and SRC.sourceinstance = SRC1.sourceinstance
JOIN  fidelity_mdwdb.f_time_card TRGT 
ON (SRC.time_sheet_line_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
LEFT JOIN fidelity_mdsdb.knta_users_final LKP_SRC 
on SRC1.resource_id = LKP_SRC.user_id and LKP_SRC.sourceinstance = SRC1.sourceinstance
WHERE COALESCE(LKP_SRC.START_DATE,'UNSPECIFIED') <> TRGT.timecard_on; 