SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_time_card.location_key' ELSE 'SUCCESS' END as Message 
FROM fidelity_mdsdb.tm_time_sheet_lines_final SRC 
join fidelity_mdsdb.tm_time_sheets_final SRC1
on SRC.time_sheet_id  = SRC1.time_sheet_id and SRC.sourceinstance = SRC1.sourceinstance
JOIN  fidelity_mdwdb.f_time_card TRGT 
ON (SRC.time_sheet_line_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
LEFT JOIN fidelity_mdsdb.knta_users_final LKP_SRC 
on SRC1.resource_id = LKP_SRC.user_id and LKP_SRC.sourceinstance = SRC1.sourceinstance
LEFT JOIN fidelity_mdwdb.d_location LKP
on  COALESCE(CONCAT(LKP_SRC.location_code,'~~~','RSC - Location'),'UNSPECIFIED') = LKP.row_id and LKP.source_id = SRC1.sourceinstance
WHERE coalesce(LKP.row_key,case when LKP_SRC.location_code is null then 0 else -1 end ) <> TRGT.location_key
AND SRC1.CREATION_DATE >'2017-01-01'

; 