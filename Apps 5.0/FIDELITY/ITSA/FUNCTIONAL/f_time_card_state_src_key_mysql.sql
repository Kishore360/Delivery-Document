SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_time_card.state_src_key' ELSE 'SUCCESS' END as Message 
FROM fidelity_mdsdb.tm_time_sheet_lines_final SRC 
join fidelity_mdsdb.tm_time_sheets_final SRC1
on SRC.TIME_SHEET_ID  = SRC1.TIME_SHEET_ID and SRC.sourceinstance = SRC1.sourceinstance
JOIN  fidelity_mdwdb.f_time_card TRGT 
ON (SRC.time_sheet_line_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
LEFT JOIN fidelity_mdwdb.d_lov LKP
on  COALESCE(CONCAT(SRC.STATE,'~~~','TM - Time Sheet Line Statuses'),'UNSPECIFIED') = LKP.row_id and LKP.source_id = SRC1.sourceinstance
WHERE coalesce(LKP.row_key,case when SRC.state is null then 0 else -1 end ) <> TRGT.state_src_key; 
