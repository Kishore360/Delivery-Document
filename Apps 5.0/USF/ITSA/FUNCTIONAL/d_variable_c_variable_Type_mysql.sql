SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_asset.computer_usage_c' ELSE 'SUCCESS' END as Message from
(select count(1) as cnt
FROM usf_mdsdb.question_final SRC 
left join usf_mdsdb.sys_choice_final SRC1 
on SRC.type=SRC1.value and SRC1.element='type' and SRC1.name like 'question' 
LEFT JOIN usf_mdwdb.d_variable_c TRGT 
 ON SRC.sys_id=TRGT.row_id 
WHERE SRC1.label<> TRGT.variable_Type)t;
