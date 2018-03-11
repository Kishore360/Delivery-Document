SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_time_card.timecard_time_key' ELSE 'SUCCESS' END as Message 
FROM fidelity_mdsdb.tm_time_sheet_lines_final SRC 
join fidelity_mdsdb.tm_time_sheets_final SRC1
on SRC.time_sheet_id  = SRC1.TIME_SHEET_ID and SRC.sourceinstance = SRC1.sourceinstance
JOIN  fidelity_mdwdb.f_time_card TRGT 
ON (SRC.time_sheet_line_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
LEFT JOIN fidelity_mdsdb.ktmg_periods_final LKP_SRC 
on SRC1.period_id = LKP_SRC.period_id and LKP_SRC.sourceinstance = SRC1.sourceinstance
LEFT join fidelity_mdwdb.d_calendar_time LKP
on COALESCE(LKP_SRC.START_DATE,'UNSPECIFIED')  = LKP.row_id and LKP_SRC.sourceinstance = LKP.source_id
WHERE coalesce(LKP.row_key,case when LKP_SRC.START_DATE is null then 0 else -1 end ) <> TRGT.timecard_time_key; 