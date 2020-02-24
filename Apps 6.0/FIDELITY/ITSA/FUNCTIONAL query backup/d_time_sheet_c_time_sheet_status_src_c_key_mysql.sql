SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.time_sheet_status_src_c_key' ELSE 'SUCCESS' END as Message 
FROM  fidelity_mdsdb.tm_time_sheets_final SRC
JOIN  fidelity_mdwdb.d_time_sheet_c TRGT 
ON (SRC.time_sheet_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
left join fidelity_mdwdb.d_lov LKP
on COALESCE(CONCAT(SRC.STATUS_CODE,'~~~','TM - Time Sheet Statuses'),'UNSPECIFIED') =LKP.row_id and SRC.sourceinstance  = LKP.source_id
WHERE coalesce(LKP.row_key,case when SRC.STATUS_CODE is null then 0 else -1 end ) <> TRGT.time_sheet_status_src_c_key; 