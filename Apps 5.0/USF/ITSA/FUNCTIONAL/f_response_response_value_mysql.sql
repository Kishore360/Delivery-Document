SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_asset.computer_usage_c' ELSE 'SUCCESS' END as Message from
(select count(1) as cnt
FROM usf_mdsdb.survey_response_final SRC 
LEFT JOIN usf_mdwdb.f_response TRGT 
on SRC.sys_id = TRGT.row_id and SRC.sourceinstance=TRGT.source_id
WHERE CASE WHEN SRC.response='A' THEN 5 WHEN SRC.response='B' THEN 4 
WHEN SRC.response='C' THEN 3 WHEN SRC.response='D' THEN 2 WHEN SRC.response='E' THEN 1 WHEN SRC.response='F' THEN 0 ELSE SRC.answer_integer END<> TRGT.response_value)t;
