SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_time_card.week_starts_on' ELSE 'SUCCESS' END as Message 
FROM fidelity_mdsdb.tm_time_sheet_lines_final SRC 
join fidelity_mdsdb.tm_time_sheets_final SRC1
on SRC.TIME_SHEET_ID  = SRC1.TIME_SHEET_ID and SRC.sourceinstance = SRC1.sourceinstance
JOIN  fidelity_mdwdb.f_time_card TRGT 
ON (SRC.time_sheet_line_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
LEFT JOIN fidelity_mdsdb.ktmg_periods_final LKP_SRC 
on SRC1.period_id = LKP_SRC.period_id and LKP_SRC.sourceinstance = SRC1.sourceinstance
WHERE LKP_SRC.start_date <> TRGT.week_starts_on; 
