SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_asset.computer_usage_c' ELSE 'SUCCESS' END as Message from
(select count(1) as cnt
FROM usf_mdsdb.question_final SRC 
LEFT JOIN usf_mdwdb.d_variable_c TRGT 
 ON SRC.sys_id=TRGT.row_id 
WHERE SRC.Reference<> TRGT.Reference)t;
